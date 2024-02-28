return {
  "dnlhc/glance.nvim",
  config = function()
    local glance = require("glance")
    local actions = glance.actions

    glance.setup({
      mappings = {
        list = {
          ['<C-c>'] = actions.close,
        },
        preview = {
          ['<C-c>'] = actions.close,
        }
      }
    })

    require("core.mapping").glance_keymap_setup()
  end,
}
