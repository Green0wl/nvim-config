return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    local lualine = require('lualine')
    local custom_config = require("configurations.plugins.lualine.lualine_config").custom_config
    lualine.setup(custom_config)
  end
}
