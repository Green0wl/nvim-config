local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Install your plugins here
	"wbthomason/packer.nvim", -- Have packer manage itself
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	"folke/which-key.nvim",

	-- Colorschemes
	"folke/tokyonight.nvim",
	"lunarvim/darkplus.nvim",

	-- Cmp
	"hrsh7th/nvim-cmp",        -- The completion plugin
	"hrsh7th/cmp-buffer",      -- buffer completions
	"hrsh7th/cmp-path",        -- path completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets
	"L3MON4D3/LuaSnip",            --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("core.treesitter")
		end
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = require 'core.autoformat'.config
	},

	-- enable LSP
	"williamboman/mason.nvim",        -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"RRethy/vim-illuminate",

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-sleuth",

	-- debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"jay-babu/mason-nvim-dap.nvim",
	"pocco81/dap-buddy.nvim",
	"theHamsta/nvim-dap-virtual-text",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim"
		}
	},
}
require("lazy").setup(plugins, {})
