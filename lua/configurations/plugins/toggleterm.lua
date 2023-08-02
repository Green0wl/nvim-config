return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = 'horizontal',
      shade_terminals = false,
      size = 20,
    })
    require("core.mapping").toggleterm_keymap_setup()
  end
}
