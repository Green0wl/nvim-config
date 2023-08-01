local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap('n', '<leader>h', ':nohlsearch<cr>', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- bufferline navigation
keymap("n", "H", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "L", ":BufferLineCycleNext<cr>", opts)

-- Nvim-Tree toggling of Explorer
local function opts_desc(desc)
  return { desc = desc, noremap = true, silent = true, nowait = true }
end

local tree_open = false
function TOGGLE_TREE()
  if tree_open then
    require("nvim-tree.api").tree.close()
  else
    require("nvim-tree.api").tree.find_file { open = true }
    require("nvim-tree.api").tree.focus()
  end
  tree_open = not tree_open
end

keymap('n', '<C-n>', ':lua TOGGLE_TREE()<CR>', opts_desc('Nvim Tree: Toggle Tree File explorer.'))

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', '<space>e', vim.diagnostic.open_float, opts_desc("Diagnostic: Open Diagnostic floating window."))
keymap('n', '[d', vim.diagnostic.goto_prev,
  opts_desc("Diagnostic: Go to previous diagnostic point (error/hint/warring)."))
keymap('n', ']d', vim.diagnostic.goto_next, opts_desc("Diagnostic: Go to next diagnostic point (error/hint/warring)."))
keymap('n', '<space>q', vim.diagnostic.setloclist, opts_desc("Diagnostic: Open Diagnostic window."))

-- for ray-x/lsp_signature.nvim
vim.keymap.set({ 'n' }, '<C-s>', function()
  require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'Toggle signature floating window help.' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'Toggle signature help.' })

-- for debugging with nvim-dap
keymap('n', '<F5>', function() require('dap').continue() end, opts_desc("Debugging: Continue/Start debugging."))
keymap('n', '<F10>', function() require('dap').step_over() end, opts_desc("Debugging: Step Over."))
keymap('n', '<F11>', function() require('dap').step_into() end, opts_desc("Debugging: Step Into."))
keymap('n', '<F12>', function() require('dap').step_out() end, opts_desc("Debugging: Step Out."))
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, opts_desc("Debugging: Toggle Breakpoint."))
keymap('n', '<Leader>B', function() require('dap').set_breakpoint() end, opts_desc("Debugging: Set Breakpoint."))
keymap('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
  opts_desc("Debugging: Set Breakpoint with message."))

keymap('n', '<Leader>dr', function() require('dap').repl.open() end, opts_desc("Debugging: Open Repl."))
keymap('n', '<Leader>dl', function() require('dap').run_last() end, opts_desc("Debugging: Run Last."))
keymap({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, opts_desc("Debugging: Open hover window."))
keymap({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, opts_desc("Debugging: Preview window."))
keymap('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, opts_desc("Debugging: Get call stack."))

keymap('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, opts_desc("Debugging: Get scopes."))

keymap("n", "<leader>q", function()
  require('dap').disconnect()
end, opts_desc("Debugging: Terminate session and close UI."))
