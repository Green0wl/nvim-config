local M = {}
function M.inject_configurations()
  local dap_ensure_installed = vim.tbl_deep_extend(
    "force",
    require("configurations.plugins.mason_nvim_dap.dap_ensure_installed").ensure_installed,
    { "netcoredbg" })

  local dap = require('dap')
  for _, value in ipairs(dap_ensure_installed) do
    local temp_conf = require("configurations.plugins.nvim_dap.dap_configurations." .. value .. "_conf")

    -- if there is something if temp_conf.conf, then use those configurations
    if temp_conf.conf ~= nil then
      if type(temp_conf.lang) == "table" then
        for _, language in ipairs(temp_conf.lang) do
          if not dap.configurations[language] then
            dap.configurations[language] = temp_conf.conf
          else
            for _, conf in ipairs(temp_conf.conf) do
              dap.configurations[language][#dap.configurations[language] + 1] = conf
            end
          end
        end
      else
        dap.configurations[temp_conf.lang] = temp_conf.conf
      end
    end
  end

  require("nvim-dap-virtual-text").setup()
end

return M
