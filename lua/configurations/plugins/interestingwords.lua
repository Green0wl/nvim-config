return {
  "Mr-LLLLL/interestingwords.nvim",
  lazy = true,
  event = "BufEnter",
  config = function()
    require("interestingwords").setup({})
  end
}
