return {
  "rcarriga/nvim-dap-ui",
  lazy = false,
  config = function()
    require("dapui").setup()

    vim.keymap.set('n', '<leader>w', function() require('dapui').toggle() end,
      { desc = "Toggle Dap-UI.", noremap = true, silent = true, nowait = true })

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
