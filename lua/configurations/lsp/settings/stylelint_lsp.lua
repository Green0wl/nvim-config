local capabilities = require("configurations.lsp.lsp_handlers").capabilities

return {
  capabilities = capabilities,
  settings = {
    stylelintplus = {
      enable = true,
      autoFixOnFormat = false,
      autoFixOnSave = false,
      validateOnType = true,
    }
  }
}
