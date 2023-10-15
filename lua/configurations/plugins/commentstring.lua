return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  lazy = true,
  event = "LspAttach",
  config = function()
    require('ts_context_commentstring').setup({})
  end
}
