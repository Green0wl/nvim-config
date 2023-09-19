local M = {}
function M.config_func()
  local lspconfig = require('lspconfig')
  local opts = {}
  local servers = require("configurations.plugins.mason.mason_ensure_installed").ensure_installed

  for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]
    local conf_opts = require("configurations.lsp.settings." .. server)

    opts = {
      on_attach = conf_opts.on_attach or require("configurations.lsp.lsp_handlers").on_attach,
      capabilities = conf_opts.capabilities or require("configurations.lsp.lsp_handlers").capabilities,
    }

    opts = vim.tbl_deep_extend("force", conf_opts, opts)

    lspconfig[server].setup(opts)
  end
end

return M
