-- official configuration for codelldb, but can be edited
-- from: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/adapters/codelldb.lua

return function(config)
  config.adapters = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.exepath('codelldb'),
      args = { '--port', '${port}' },
    },
  }
  require('mason-nvim-dap').default_setup(config) -- don't forget this!
end
