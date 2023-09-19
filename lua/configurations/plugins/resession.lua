return {
  'stevearc/resession.nvim',
  lazy = false,
  config = function()
    local resession = require('resession')
    resession.setup({
      autosave = {
        enabled = true,
        interval = 60,
        notify = true,
      },
    })

    require("core.mapping").resession_keymap_setup(resession)

    local function get_git_root()
      local dot_git_path = vim.fn.finddir(".git", ".;")
      return vim.fn.fnamemodify(dot_git_path, ":h")
    end

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Only load the session if nvim was started with no args
        if vim.fn.argc(-1) == 0 then
          local resessionLoadPath = (get_git_root() == ".") and vim.fn.getcwd() or get_git_root()
          -- Save these to a different directory, so our manual sessions don't get polluted
          resession.load(resessionLoadPath, { dir = "dirsession", silence_errors = true })
        end
      end,
    })
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        local resessionSavePath = (get_git_root() == ".") and vim.fn.getcwd() or get_git_root()
        resession.save(resessionSavePath, { dir = "dirsession", notify = false })
      end,
    })
  end
}
