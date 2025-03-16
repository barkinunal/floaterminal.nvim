local window = require("floaterminal.window")
local config = require("floaterminal.config")

local M = {}
local state = { { win = -1, buf = -1 } }
local current_tab_index = 1
local MAX_TABS = config.MAX_TABS or 3

local add_empty_state = function()
	table.insert(state, { buf = -1, win = -1 })
end

local create_terminal_window = function()
	local current_state = window.create_floating_window({ buf = state[current_tab_index].buf })
	if vim.bo[current_state.buf].buftype ~= "terminal" then
		vim.cmd.terminal()
	end
	state[current_tab_index] = current_state
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state[current_tab_index].win) then
		create_terminal_window()
	else
		vim.api.nvim_win_hide(state[current_tab_index].win)
	end
end

local round_robin = function(x, y)
	if x > y then
		x = 1
	elseif current_tab_index == 0 then
		x = y
	end
	return x
end

local perform = function(action)
	toggle_terminal()
	action()
	current_tab_index = round_robin(current_tab_index, #state)
	toggle_terminal()
end

M.toggle_terminal = toggle_terminal

M.add_tab = function()
	if #state < MAX_TABS then
		perform(function()
			add_empty_state()
			current_tab_index = #state
		end)
	end
end

M.remove_tab = function()
	perform(function()
		table.remove(state, current_tab_index)
		if #state == 0 then
			add_empty_state()
		end
		current_tab_index = current_tab_index - 1
	end)
end

M.next_tab = function()
	perform(function()
		current_tab_index = current_tab_index + 1
	end)
end

M.previous_tab = function()
	perform(function()
		current_tab_index = current_tab_index - 1
	end)
end

return M
