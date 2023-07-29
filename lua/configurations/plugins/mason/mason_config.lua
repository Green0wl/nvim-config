local M = {}
function M.config_func()
  require("mason").setup({
    pip = {
      -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
      upgrade_pip = true,
      install_args = {},
    },
  })
end
return M
