return {
  "yamatsum/nvim-cursorline",
  lazy = true,
  event = "BufEnter",
  config = function()
    require('nvim-cursorline').setup {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = false,
      }
    }
  end
}
