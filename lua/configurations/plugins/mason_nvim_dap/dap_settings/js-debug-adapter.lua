local M = {}

-- M.dap_name = "js"

M.func = function()
  local dap = require("dap")
  if not dap.adapters["pwa-node"] then
    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
          .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
  end
end

return M
