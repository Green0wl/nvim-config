return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  config = function()
    require("core.mapping").vim_tmux_navigator_keymap_setup()
  end
}
