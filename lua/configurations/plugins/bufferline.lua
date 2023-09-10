return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    require("bufferline").setup({
      highlights = {},

      ---@diagnostic disable-next-line: missing-fields
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.normal,
        themable = true,
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "center",
            separator = true
          }
        },
        show_tab_indicators = true,
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end
      }
    })
  end
}
