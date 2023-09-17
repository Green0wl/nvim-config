return {
  'stevearc/resession.nvim',
  lazy = false,
  config = function()
    local resession = require('resession')
    resession.setup({
      autosave = {
        enabled = true,
        interval = 60,
        notify = true,
      },
    })

    require("core.mapping").resession_keymap_setup(resession)
  end
}
