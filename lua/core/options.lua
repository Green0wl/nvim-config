vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
  -- General settings
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard

  -- Appearance settings
  foldlevelstart = 99,
  conceallevel = 0,       -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true,        -- highlight all matches on previous search pattern
  incsearch = true,       -- search as characters are entered
  ignorecase = true,      -- ignore case in search patterns
  mouse = "",             -- allow the mouse to be used in neovim
  pumheight = 10,         -- pop up menu height
  showmode = false,
  showtabline = 2,        -- always show tabs
  smartcase = true,       -- smart case
  smartindent = true,     -- make indenting smarter again
  splitbelow = true,      -- force all horizontal splits to go below current window
  splitright = true,      -- force all vertical splits to go to the right of current window
  swapfile = false,       -- creates a swapfile
  undofile = true,        -- enable persistent undo
  updatetime = 300,       -- faster completion (4000ms default)
  writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- Indentation settings
  shiftround = true,
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2,   -- the number of spaces inserted for each indentation
  tabstop = 2,      -- insert 2 spaces for a tab
  softtabstop = 2,
  spell = true,

  -- Line display settings
  cursorline = true,         -- highlight the current line
  number = true,             -- set numbered lines
  relativenumber = true,     -- set relative numbered lines
  numberwidth = 2,           -- set number column width to 2 {default 4}
  signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
  wrap = false,              -- display lines as one long line
  scrolloff = 8,             -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications

  -- Miscellaneous settings
  showcmd = true,

  cmdheight = 2,        -- more space in the neovim command line for displaying messages
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 250,     -- time to wait for a mapped sequence to complete (in milliseconds)

  linebreak = true,     -- companion to wrap, don't split words
  whichwrap = "bs<>[]",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"                          -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                          -- hyphenated words recognized by searches

vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
