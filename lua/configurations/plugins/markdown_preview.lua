return {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.fn["mkdp#util#install"]()
  end,
  ft = { "markdown" },
}
