return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      enable_check_bracket_line = false,
      fast_wrap = {
        map = '<A-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        manual_position = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    })
  end
}
