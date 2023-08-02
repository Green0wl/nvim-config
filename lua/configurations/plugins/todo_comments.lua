return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({})
    require("core.mapping").todo_keymap_setup()
  end
}
