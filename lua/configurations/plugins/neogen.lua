return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "LspAttach",
  config = function()
    require('neogen').setup({
      snippet_engine = "vsnip",
      languages = {
        ['cpp.doxygen'] = require('neogen.configurations.cpp'),
        ['cs.doxygen'] = require('neogen.configurations.cs'),
        ['typescript.tsdoc'] = require('neogen.configurations.typescript'),
      }
    })

    require("core.mapping").neogen_keymap_setup()
  end,
}
