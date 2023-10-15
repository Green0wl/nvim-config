return {
  "folke/paint.nvim",
  lazy = true,
  event = "LspAttach",
  config = function()
    require("paint").setup({
      highlights = {
        {
          -- filter can be a table of buffer options that should match,
          -- or a function called with buf as param that should return true.
          -- The example below will paint @something in comments with Constant
          filter = { filetype = "lua" },
          pattern = "%s*%-%-%-%s*(@%w+)",
          hl = "Constant",
        },
        {
          filter = { filetype = "typescript" },
          pattern = "%s*%*%s*(@%w+)",
          hl = "Constant",
        },
      },
    })
  end,
}
