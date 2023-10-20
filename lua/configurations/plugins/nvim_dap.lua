return {
  "mfussenegger/nvim-dap",
  lazy = true,
  config = function()
    local dap = require('dap')
    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/kitty',
      args = { '-e' },
    }
  end
}
