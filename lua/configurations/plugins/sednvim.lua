return {
  "Green0wl/sednvim",
  config = function()
    vim.keymap.set("n", "<leader>dc", function()
      require("sednvim").sedcmd_input()
    end, {})
  end,
  dependencies = {
    { 'rcarriga/nvim-notify' },
    { "nvim-lua/plenary.nvim" },
    { 'MunifTanjim/nui.nvim' },
  }
}
