local config = require("floaterminal.config")

local M = {}

M.create_floating_window = function(opts)
	opts = opts or {} -- default config if nil is passed

	local screen_width = vim.o.columns
	local screen_height = vim.o.lines

	local default_width = math.floor(screen_width * 0.8)
	local default_height = math.floor(screen_height * 0.8)

	local width = math.floor(screen_width * config.options.width) or default_width
	local height = math.floor(screen_height * config.options.height) or default_height

	local row = math.floor((screen_height - height) / 2)
	local col = math.floor((screen_width - width) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- create a scratch buffer, no swap file
	end

	local win_config = vim.tbl_extend("force", { -- "force" is to overwrite default if specified in config
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = config.options.border or "rounded", -- adds a rounded border, you can customize this
	}, opts.win_opts or {}) -- merge win_opts from config if provided, for extra options

	local win = vim.api.nvim_open_win(buf, true, win_config)
	return { win = win, buf = buf }
end

return M
