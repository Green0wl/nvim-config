local capabilities = require("configurations.lsp.lsp_handlers").capabilities

return {
  capabilities = capabilities,
  settings = {
    stylelintplus = {
      enable = true,
      autoFixOnFormat = true,
      autoFixOnSave = true,
      validateOnType = true,
    }
  }
}
