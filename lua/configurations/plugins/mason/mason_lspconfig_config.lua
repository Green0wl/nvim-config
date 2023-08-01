local M = {}
function M.config_func()
  require("mason-lspconfig").setup {
    ensure_installed = require("configurations.plugins.mason.mason_ensure_installed").ensure_installed,
  }
end

return M
