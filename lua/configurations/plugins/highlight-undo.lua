return {
  'tzachar/highlight-undo.nvim',
  config = function()
    vim.api.nvim_set_hl(0, "HighlightUndo", { bg = "#282828", fg = "#ebdbb2", bold = true })
    vim.api.nvim_set_hl(0, "HighlightRedo", { bg = "#fabd2f", fg = "#32302f", bold = true })

    require('highlight-undo').setup({
      undo = { hlgroup = 'HighlightUndo' },
      redo = { hlgroup = 'HighlightRedo' },
    })
  end
}
