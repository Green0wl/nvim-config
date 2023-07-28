require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb", "cppdbg", "python" },
	handlers = {},
})

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<cr>")
vim.keymap.set("n", "<leader>dx", ":DapTerminate<cr>")
vim.keymap.set("n", "<leader>do", ":DapStepOver<cr>")
vim.keymap.set("n", "<leader>dr", ":DapContinue<cr>")
vim.keymap.set("n", "<leader>di", ":DapStepInto<cr>")
vim.keymap.set("n", "<leader>dw", ":lua require('dapui').close()<cr>")

vim.keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F9>", ":lua require('dap').continue()<CR>")

vim.keymap.set("n", "<F1>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F2>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F3>", ":lua require('dap').step_out()<CR>")

vim.keymap.set("n", "<Leader>dsc", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<Leader>dso", ":lua require('dap').step_out()<CR>")

vim.keymap.set("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
vim.keymap.set("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>")

vim.keymap.set("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
vim.keymap.set("n", "<Leader>duf",
	":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")

vim.keymap.set("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>")
vim.keymap.set("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>")

vim.keymap.set("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>dbm",
	":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>")
vim.keymap.set("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")

vim.keymap.set("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")
vim.keymap.set("n", "<Leader>di", ":lua require('dapui').toggle()<CR>")

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

require("core.dap-conf.cpp")
