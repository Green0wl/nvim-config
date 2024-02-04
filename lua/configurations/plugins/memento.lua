return {
  'gaborvecsei/memento.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("core.mapping").memento_keymap_setup()
  end
}
