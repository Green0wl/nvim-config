local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
M.capabilities = capabilities

function M.on_attach(client, bufnr)
  local nmap = function(buff, keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = buff, desc = desc, noremap = true, silent = true })
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  nmap(bufnr, 'gD', vim.lsp.buf.declaration, "LSP: Get Declaration.")
  -- nmap(bufnr, 'K', vim.lsp.buf.hover, "Get additional info: Like on Hover.")
  nmap(bufnr, '<space>wa', vim.lsp.buf.add_workspace_folder, "[W]orkspace: [A]dd Folder")
  nmap(bufnr, '<space>wr', vim.lsp.buf.remove_workspace_folder, "[W]orkspace: [R]emove Folder")
  nmap(bufnr, '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "LSP: Get Workspace folders List")

  nmap(bufnr, '<space>D', vim.lsp.buf.type_definition, "Get [D]efinition")
  nmap(bufnr, '<space>rn', vim.lsp.buf.rename, "[R]e[n]ame")
  vim.keymap.set(
    { 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
    { buffer = bufnr, desc = "[C]ode [A]ction", noremap = true, silent = true })

  nmap(bufnr, '<space>f', function()
    -- vim.lsp.buf.format({ bufnr = bufnr })
    vim.diagnostic.enable(bufnr)
    require('conform').format({
        lsp_fallback = true,
        async = true,
        timeout = 500,
      },
      function() vim.cmd(":w") end
    )
  end, "[F]ormat current buffer.")

  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, {
      keymaps = {
        close_signature = "<A-c>"
      },
    })
  end
end

return M
