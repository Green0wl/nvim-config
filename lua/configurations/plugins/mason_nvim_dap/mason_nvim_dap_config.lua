local M = {}
function M.config_func()
  require("mason-nvim-dap").setup({
    ensure_installed = require("configurations.plugins.mason_nvim_dap.dap_ensure_installed").ensure_installed,
    automatic_installation = true,
    handlers = require("configurations.plugins.mason_nvim_dap.dap_handlers")
  })

  -- setting self-written configurations for debuggers
  require("configurations.plugins.nvim_dap.configuration_injector").inject_configurations()
end

return M
