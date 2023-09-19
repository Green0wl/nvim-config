return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local banned_messages = { "No information available" }

    -- A workaround from https://github.com/neovim/nvim-lspconfig/issues/1931
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      return require("notify")(msg, ...)
    end
  end,
}
