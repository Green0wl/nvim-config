local servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"csharp_ls",
	"clangd",
	"cssmodules_ls",
	"unocss",
	"vtsls",
	"angularls",
	-- "bashls",
	"jsonls",
	"clangd",
	-- "yamlls",
}

local servers_without_config = {
	"clang-format",
	"codelldb",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = TableConcat(servers, servers_without_config),
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("no lspconfig plugin")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("core.lsp.handlers").on_attach,
		capabilities = require("core.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "core.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
