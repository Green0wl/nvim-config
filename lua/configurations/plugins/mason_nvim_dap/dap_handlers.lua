local handlers = {
  function(config)
    -- all sources with no handler get passed here

    -- Keep original functionality
    require('mason-nvim-dap').default_setup(config)
  end,
}

local dap_ensure_installed =
    require("configurations.plugins.mason_nvim_dap.dap_ensure_installed").ensure_installed

-- forming handlers with custom setups for debuggers
for _, value in ipairs(dap_ensure_installed) do
  local dap_setting = require("configurations.plugins.mason_nvim_dap.dap_settings." .. value);
  if type(dap_setting) == "function" then
    handlers[value] = dap_setting;
  else
    ---@diagnostic disable-next-line: undefined-field

    -- does not work...
    -- handlers[dap_setting.dap_name] = dap_setting.func

    dap_setting.func()
  end
end

return handlers
