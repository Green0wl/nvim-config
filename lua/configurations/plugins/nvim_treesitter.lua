return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = require("configurations.plugins.nvim_treesitter_configs.nvim_treesitter_conf").config_func
}
