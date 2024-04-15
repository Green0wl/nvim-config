return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  config = function()
    require('mason-tool-installer').setup({
      auto_update = true,
      ensure_installed = {
        "trivy",
        "codespell",
        "ast-grep",
        "prettier",
        "checkmake",
        "js-debug-adapter"
      }
    })
  end
}
