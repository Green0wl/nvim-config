return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio"
  },
  lazy = false,
  config = function()
    require("dapui").setup()

    local function get_condition(table, line, bufnr)
      if table[bufnr] == nil then return nil end

      for _, entry in ipairs(table[bufnr]) do
        if entry.line == line then
          return entry.condition or nil
        end
      end
      return nil
    end

    local function set_breakpoint_ui(default_text)
      vim.ui.input({ prompt = 'Breakpoint Condition: ', default = default_text }, function(input)
        require('dap').set_breakpoint(tostring(input))
      end)
    end

    vim.keymap.set('n', '<leader>w', function() require('dapui').toggle() end,
      { desc = "Debugging: Toggle Dap-UI.", noremap = true, silent = true, nowait = true })

    vim.keymap.set('n', '<leader>bc',
      set_breakpoint_ui,
      { desc = "Debugging: Set conditional breakpoint.", noremap = true, silent = true, nowait = true })

    vim.keymap.set('n', '<leader>bh', function()
        local condition = get_condition(
          require('dap.breakpoints').get(),
          vim.api.nvim__buf_stats(0).current_lnum,
          vim.fn.bufnr()
        )
        if condition ~= nil then
          set_breakpoint_ui(condition)
          return
        end
        require("notify")("No breakpoint condition.", "info", {
          title = "DBG",
          render = "compact"
        })
      end,
      { desc = "Debugging: Show a breakpoint condition on this line.", noremap = true, silent = true, nowait = true })

    -- auto closing and opening windows.
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end
}
