return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        csharp = { "ast-grep", "codespell" },
        typescript = { "prettier", "codespell" }
      },
      ["*"] = { "codespell" },
      ["_"] = { "trim_whitespace" },
      format_on_save = false
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 500
      })
    end, { desc = "Format file or range." })
  end
}
