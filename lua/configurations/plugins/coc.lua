return {
  'neoclide/coc.nvim',
  branch = 'release',
  init = function ()
    vim.g.coc_start_at_startup = 1
    vim.g.coc_config_home = '$HOME/.config/nvim/lua/configurations/plugins/coc/'
    vim.g.coc_global_extensions = require("configurations.plugins.coc.coc_ensure_installed")
  end,
  config = function()
    require("core.mapping").coc_keymap_setup()

  end,
  build = "yarn install --frozen-lockfile",
}
