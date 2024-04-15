return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    'nvim-neotest/neotest-jest',
    "marilari88/neotest-vitest",
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-vitest"),
      }
    })
  end,
  keys = {
    {
      "<leader>ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "Neotest: Stop Test",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Neotest: Run Test",
    },
    {
      "<leader>tu",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Neotest: Toggle Summary",
    },
    {
      "<leader>ty",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Neotest: Run Last Test",
    },
    {
      "<leader>tyy",
      function()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "Neotest: Debug Last Test",
    },
  },
}
