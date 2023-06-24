local winnr

local is_float_win_open = function()
	if winnr then
		return vim.api.nvim_win_is_valid(winnr)
	end
	return false
end

local close_float_win = function()
	if is_float_win_open() then
		vim.api.nvim_win_close(winnr, true)
	end
end

local open_float_win = function()
	if is_float_win_open() then
		return
	end

	local core = require("niuiic-core")
	local win_config = core.win.proportional_size(1, 1)
	local prev_zindex = vim.api.nvim_win_get_config(0).zindex or 0
	local win_handle = core.win.open_float(0, {
		relative = "editor",
		row = win_config.row,
		col = win_config.col,
		width = win_config.width,
		height = win_config.height,
		border = "single",
		zindex = prev_zindex + 1,
		enter = true,
	})
	winnr = win_handle.winnr
end

local maximize = function()
	if is_float_win_open() then
		close_float_win()
	else
		open_float_win()
	end
end

return {
	maximize = maximize,
}
