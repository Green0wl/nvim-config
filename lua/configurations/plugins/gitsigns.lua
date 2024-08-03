return {
  'lewis6991/gitsigns.nvim',
  lazy = true,
  event = { "UIEnter" },
  config = require("configurations.plugins.gitsigns.gitsigns_config").config_func
}
