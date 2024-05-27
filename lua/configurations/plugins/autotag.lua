return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('nvim-ts-autotag').setup()

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        underline = true,
        update_in_insert = true,
      }
    )
  end
}
