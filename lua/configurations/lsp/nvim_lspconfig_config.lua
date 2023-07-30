local M = {}
function M.config_func()
  local lspconfig = require('lspconfig')
  local opts = {}
  local servers = require ("configurations.plugins.mason.mason_ensure_installed").ensure_installed

  for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]

    opts = {
      on_attach = require("configurations.lsp.lsp_handlers").on_attach,
      capabilities = require("configurations.lsp.lsp_handlers").capabilities,
    }

    local conf_opts = require("configurations.lsp.settings." .. server)
    opts = vim.tbl_deep_extend("force", conf_opts, opts)

    lspconfig[server].setup(opts)
  end
end
return M
