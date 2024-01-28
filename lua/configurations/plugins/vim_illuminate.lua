return {
  "RRethy/vim-illuminate",
  lazy = true,
  event = "BufEnter",
  config = function()
    require('illuminate').configure({});
    local bgIlluminated = "#404040";

    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = bgIlluminated })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = bgIlluminated })
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = bgIlluminated })
  end
}
