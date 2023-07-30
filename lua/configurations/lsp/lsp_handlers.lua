local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = capabilities

function M.on_attach(_, bufnr)
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
  nmap(bufnr, 'gD', vim.lsp.buf.declaration, "[G]et [D]eclaration.")
  nmap(bufnr, 'gd', vim.lsp.buf.definition, "[G]et [d]efinition")
  nmap(bufnr, 'K', vim.lsp.buf.hover, "Get additional info: Like on Hover.")
  nmap(bufnr, 'gi', vim.lsp.buf.implementation, "[G]et [I]mplementation")
  nmap(bufnr, '<C-k>', vim.lsp.buf.signature_help, "Get Help of signature.")
  nmap(bufnr, '<space>wa', vim.lsp.buf.add_workspace_folder, "[W]orkspace: [A]dd Folder")
  nmap(bufnr, '<space>wr', vim.lsp.buf.remove_workspace_folder, "[W]orkspace: [R]emove Folder")
  nmap(bufnr, '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "Get [W]orkspace folders [L]ist")

  nmap(bufnr, '<space>D', vim.lsp.buf.type_definition, "Get [D]efinition")
  nmap(bufnr, '<space>rn', vim.lsp.buf.rename, "[R]e[n]ame")
  vim.keymap.set(
    { 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
    { buffer = bufnr, desc = "[C]ode [A]ction", noremap = true, silent = true })

  nmap(bufnr, 'gr', vim.lsp.buf.references, "[G]et [R]eferences")
  nmap(bufnr, '<space>f', function()
    vim.lsp.buf.format({ bufnr = bufnr })
    vim.diagnostic.enable(bufnr)
  end, "[F]ormat current buffer.")
end

return M
