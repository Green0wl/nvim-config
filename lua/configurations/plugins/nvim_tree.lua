vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
	  require("nvim-tree").setup {
		  on_attach = require("configurations.plugins.nvim_tree.nvim_tree_mappings").on_attach,
		  sort_by = "case_sensitive",
		  view = {
			  width = 30,
		  },
		  renderer = {
			  group_empty = true,
		  },
		  filters = {
			  dotfiles = true,
		  },

	  }
  end,
}
