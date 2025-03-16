local M = {}

M.setup = function(opts)
	require("floaterminal.config").setup(opts)
	require("floaterminal.commands").setup()
end

return M
