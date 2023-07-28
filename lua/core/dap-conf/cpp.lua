local dap          = require("dap")

dap.configurations = {
	cpp = {
		{
			type = "cppdbg", -- Which adapter to use
			name = "Debug",  -- Human readable name
			request = "launch", -- Whether to "launch" or "attach" to program
			-- program = "${file}", -- The buffer you are focused on when running nvim-dap
			program = function()
				return vim.fn.input('Filename to debug: ')
			end,
			cwd = vim.fn.getcwd(),
			externalConsole = true, -- Открывать внешний терминал
			console = "terminal" -- Использовать плагин vim-terminal для терминала
		},
	}
}

dap.adapters.cpp   = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}
