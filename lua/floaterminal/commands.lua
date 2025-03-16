local terminal = require("floaterminal.terminal")

local M = {}

M.setup = function()
	vim.api.nvim_create_user_command("Floaterminal", terminal.toggle_terminal, {})
	vim.api.nvim_create_user_command("FloaterminalTabNew", terminal.add_tab, {})
	vim.api.nvim_create_user_command("FloaterminalTabC", terminal.remove_tab, {})
	vim.api.nvim_create_user_command("FloaterminalTabN", terminal.next_tab, {})
	vim.api.nvim_create_user_command("FloaterminalTabP", terminal.previous_tab, {})
end

return M
