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
  handlers[value] = require("configurations.plugins.mason_nvim_dap.dap_settings." .. value)
end

return handlers
