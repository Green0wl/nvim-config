return {
  "moll/vim-bbye",
  lazy = false,
  config = function()
    require("core.mapping").bbye_keymap_setup()
  end
}
