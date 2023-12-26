return {
  "Issafalcon/lsp-overloads.nvim",
  config = function()
    vim.api.nvim_set_keymap("n", "<A-u>", ":LspOverloadsSignature<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("i", "<A-u>", "<cmd>LspOverloadsSignature<CR>", { noremap = true, silent = true })
  end
}
