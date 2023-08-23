-- all files in directory `dap_congifurations` allow to configure
-- behaviour of debuggers: how to setup? which parameters?
-- config example: https://github.com/vadimcn/codelldb/blob/master/MANUAL.md#starting-a-new-debug-session
-- it needs also to be refactored to lua format.

local M = {}
M.lang = "cpp"

-- set `M.conf = nil` if you want to use default configs
M.conf = nil

return M
