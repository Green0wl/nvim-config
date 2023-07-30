-- fix for: https://www.reddit.com/r/neovim/comments/15dfx4g/help_lsp_diagnostics_are_not_being_displayed/
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function(ev)
    vim.diagnostic.enable(ev.buf)
  end
})
