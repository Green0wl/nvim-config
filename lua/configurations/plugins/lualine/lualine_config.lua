local M = {}

local time_table = {
  'datetime',
  style = '%H:%M'
}

M.custom_config = {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode", time_table }
  }
}

return M
