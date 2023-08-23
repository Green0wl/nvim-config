return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files                = { theme = "dropdown" },
        spell_suggest             = { theme = "dropdown" },
        current_buffer_fuzzy_find = { theme = "dropdown" },
        diagnostics               = { theme = "dropdown" },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    }
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("ui-select")

    require("core.mapping").telescope_keymap_setup()
  end
}
