return {
  'mfussenegger/nvim-lint',
  lazy = false,
  config = function()
    require('lint').linters_by_ft = {
      markdown = require("lua.configurations.plugins.nvim_lint.linters_config")
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
