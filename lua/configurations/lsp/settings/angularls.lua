local mason_registry = require("mason-registry")
local angularls = mason_registry.get_package("angular-language-server")
local angularls_path = angularls:get_install_path()

local capabilities = require("configurations.lsp.lsp_handlers").capabilities
local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  angularls_path,
  "--ngProbeLocations",
  angularls_path .. "/node_modules/@angular/language-server"
}

return {
  cmd = cmd,
  capabilities = capabilities,
  on_new_config = function(new_config, _) -- '_' = new_root_dir
    new_config.cmd = cmd
  end,
}
