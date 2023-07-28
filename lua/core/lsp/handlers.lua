local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		print(desc)

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "[G]et [D]eclaration")
	nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "[G]et [d]efinition")
	nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Show additional info on hover.")
	nmap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]et [I]mplementation")
	nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "[G]et [r]eferences")
	nmap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Dia[g]nostic open F[l]oat window.")
	nmap("<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "[L]ua format current [f]ile.")
	nmap("<leader>li", "<cmd>LspInfo<cr>", "[L]sp [i]nfo")
	nmap("<leader>lI", "<cmd>LspInstallInfo<cr>", "[L]sp [I]nstall [I]nfo")
	nmap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "[L]ua [C]ode actions.")
	nmap("<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Go to the next diagnostic hint/error/warring.")
	nmap("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		"Go to the previous diagnostic hint/error/warring.")
	nmap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "[L]ua [R]ename variable.")
	nmap("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "[L]ua [S]ignature help.")
	nmap("<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", "Get diagnostic list with all errors/hints/warrings.")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

vim.diagnostic.config { virtual_text = true }

return M
