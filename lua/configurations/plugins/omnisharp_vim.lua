return {
  "OmniSharp/Omnisharp-vim",
  config = function()
    vim.g.OmniSharp_server_use_net6 = 1
    vim.g.OmniSharp_server_stdio = 0
  end
}
