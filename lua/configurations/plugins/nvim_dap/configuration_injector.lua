local M = {}
function M.inject_configurations()
  local dap_ensure_installed =
      require("configurations.plugins.mason_nvim_dap.dap_ensure_installed").ensure_installed

  local dap = require('dap')
  for _, value in ipairs(dap_ensure_installed) do
    local temp_conf = require("configurations.plugins.nvim_dap.dap_configurations." .. value .. "_conf")

    -- if there is something if temp_conf.conf, then use those configurations
    if temp_conf.conf ~= nil then
      dap.configurations[temp_conf.lang] = temp_conf.conf
    end
  end

  require("nvim-dap-virtual-text").setup()
end

return M
