return {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup({
      task_list = {
        direction = "right",
      }
    })
    require('core.mapping').overseer_keymap_setup()
  end
}
