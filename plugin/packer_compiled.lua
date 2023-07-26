-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/greenowl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/greenowl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/greenowl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/greenowl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/greenowl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/lunarvim/darkplus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n`\0\0\6\1\3\0\v-\0\0\0\19\0\0\0.\0\0\0006\0\0\0'\2\1\0006\3\2\0-\5\0\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\0€\rtostring Setting autoformatting to: \nprint¡\1\0\1\6\1\a\0\21-\1\0\0009\2\0\0008\1\2\1\14\0\1\0X\1\f€'\1\1\0009\2\2\0&\1\2\0016\2\3\0009\2\4\0029\2\5\2\18\4\1\0005\5\6\0B\2\3\2-\3\0\0009\4\0\0<\2\4\3-\1\0\0009\2\0\0008\1\2\1L\1\2\0\1À\1\0\1\nclear\2\24nvim_create_augroup\bapi\bvim\tname\26kickstart-lsp-format-\aid0\0\1\3\1\1\0\t9\1\0\0-\2\0\0009\2\0\2\4\1\2\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\1\0\aidh\1\0\4\2\a\0\14-\0\0\0\14\0\0\0X\0\1€2\0\t€6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0003\3\5\0=\3\6\2B\0\2\1K\0\1\0K\0\1\0\1\0\2À\vfilter\0\1\0\1\nasync\1\vformat\bbuf\blsp\bvimº\2\1\1\v\2\18\0\"9\1\0\0009\1\1\0016\2\2\0009\2\3\0029\2\4\2\18\4\1\0B\2\2\0029\3\5\0009\4\6\0029\4\a\4\14\0\4\0X\4\1€2\0\19€9\4\b\2\a\4\t\0X\4\1€2\0\16€6\4\2\0009\4\n\0049\4\v\4'\6\f\0005\a\r\0-\b\0\0\18\n\2\0B\b\2\2=\b\14\a=\3\15\a3\b\16\0=\b\17\aB\4\3\0012\0\0€K\0\1\0K\0\1\0K\0\1\0\2À\0€\rcallback\0\vbuffer\ngroup\1\0\0\16BufWritePre\24nvim_create_autocmd\bapi\rtsserver\tname\31documentFormattingProvider\24server_capabilities\bbuf\21get_client_by_id\blsp\bvim\14client_id\tdata—\2\1\0\v\0\15\0\27+\0\2\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0003\4\4\0004\5\0\0B\1\4\0014\1\0\0003\2\5\0006\3\0\0009\3\1\0039\3\6\3'\5\a\0005\6\v\0006\a\0\0009\a\1\a9\a\b\a'\t\t\0005\n\n\0B\a\3\2=\a\f\0063\a\r\0=\a\14\6B\3\3\0012\0\0€K\0\1\0\rcallback\0\ngroup\1\0\0\1\0\1\nclear\2 kickstart-lsp-attach-format\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\0\0\26KickstartFormatToggle\29nvim_create_user_command\bapi\bvim\0" },
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/greenowl/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n`\0\0\6\1\3\0\v-\0\0\0\19\0\0\0.\0\0\0006\0\0\0'\2\1\0006\3\2\0-\5\0\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\0€\rtostring Setting autoformatting to: \nprint¡\1\0\1\6\1\a\0\21-\1\0\0009\2\0\0008\1\2\1\14\0\1\0X\1\f€'\1\1\0009\2\2\0&\1\2\0016\2\3\0009\2\4\0029\2\5\2\18\4\1\0005\5\6\0B\2\3\2-\3\0\0009\4\0\0<\2\4\3-\1\0\0009\2\0\0008\1\2\1L\1\2\0\1À\1\0\1\nclear\2\24nvim_create_augroup\bapi\bvim\tname\26kickstart-lsp-format-\aid0\0\1\3\1\1\0\t9\1\0\0-\2\0\0009\2\0\2\4\1\2\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\1\0\aidh\1\0\4\2\a\0\14-\0\0\0\14\0\0\0X\0\1€2\0\t€6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0003\3\5\0=\3\6\2B\0\2\1K\0\1\0K\0\1\0\1\0\2À\vfilter\0\1\0\1\nasync\1\vformat\bbuf\blsp\bvimº\2\1\1\v\2\18\0\"9\1\0\0009\1\1\0016\2\2\0009\2\3\0029\2\4\2\18\4\1\0B\2\2\0029\3\5\0009\4\6\0029\4\a\4\14\0\4\0X\4\1€2\0\19€9\4\b\2\a\4\t\0X\4\1€2\0\16€6\4\2\0009\4\n\0049\4\v\4'\6\f\0005\a\r\0-\b\0\0\18\n\2\0B\b\2\2=\b\14\a=\3\15\a3\b\16\0=\b\17\aB\4\3\0012\0\0€K\0\1\0K\0\1\0K\0\1\0\2À\0€\rcallback\0\vbuffer\ngroup\1\0\0\16BufWritePre\24nvim_create_autocmd\bapi\rtsserver\tname\31documentFormattingProvider\24server_capabilities\bbuf\21get_client_by_id\blsp\bvim\14client_id\tdata—\2\1\0\v\0\15\0\27+\0\2\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0003\4\4\0004\5\0\0B\1\4\0014\1\0\0003\2\5\0006\3\0\0009\3\1\0039\3\6\3'\5\a\0005\6\v\0006\a\0\0009\a\1\a9\a\b\a'\t\t\0005\n\n\0B\a\3\2=\a\f\0063\a\r\0=\a\14\6B\3\3\0012\0\0€K\0\1\0\rcallback\0\ngroup\1\0\0\1\0\1\nclear\2 kickstart-lsp-attach-format\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\0\0\26KickstartFormatToggle\29nvim_create_user_command\bapi\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
