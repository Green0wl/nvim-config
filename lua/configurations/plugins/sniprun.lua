return {
  'michaelb/sniprun',
  build = 'sh ./install.sh',
  lazy = true,
  event = "BufEnter",

  config = function()
    require('sniprun').setup({
      selected_interpreters = {},
      repl_enable = {},       --# enable REPL-like behavior for the given interpreters
      repl_disable = {},      --# disable REPL-like behavior for the given interpreters

      interpreter_options = { --# interpreter-specific options, see doc / :SnipInfo <name>

        --# use the interpreter name as key
        GFM_original = {
          use_on_filetypes = { "markdown.pandoc" } --# the 'use_on_filetypes' configuration key is
          --# available for every interpreter
        },
        Python3_original = {
          error_truncate = "auto" --# Truncate runtime errors 'long', 'short' or 'auto'
          --# the hint is available for every interpreter
          --# but may not be always respected
        }
      },

      --# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
      --# to filter only sucessful runs (or errored-out runs respectively)
      display = {
        -- "Classic", --# display results in the command-line  area
        -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

        -- "VirtualText",             --# display results as virtual text
        -- "TempFloatingWindow",      --# display results in a floating window
        -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
        "Terminal",         --# display results in a vertical split
        "TerminalWithCode", --# display results and code history in a vertical split
        -- "NvimNotify",              --# display with the nvim-notify plugin
        -- "Api"                      --# return output to a programming interface
      },

      display_options = {
        terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
        terminal_line_number = false,           --# whether show line number in terminal window
        terminal_signcolumn = false,            --# whether show signcolumn in terminal window
        terminal_persistence = true,            --# always keep the terminal open (true) or close it at every occasion (false)
        terminal_width = 95,                    --# change the terminal display option width
        notification_timeout = 5                --# timeout for nvim_notify output
      },

      inline_messages = false,
      borders = 'single', --# possible values are 'none', 'single', 'double', or 'shadow'
    })

    require("core.mapping").sniprun_keymap_setup()
  end
}
