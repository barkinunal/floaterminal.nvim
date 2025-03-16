local M = {}

M.options = {
	width = 0.8,
	height = 0.8,
	border = "rounded",
	max_tabs = 3,
}

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
