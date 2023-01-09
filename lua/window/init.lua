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
	local cur_win_zindex = vim.api.nvim_win_get_config(0).zindex or 0
	if is_float_win_open() then
		return
	end
	winnr = vim.api.nvim_open_win(0, true, {
		relative = "editor",
		row = 0,
		col = 0,
		width = vim.go.columns,
		height = vim.go.lines,
		border = "single",
		zindex = cur_win_zindex + 1,
	})
end

local toggle_max_win = function()
	if is_float_win_open() then
		close_float_win()
	else
		open_float_win()
	end
end

return {
	toggle_max_win = toggle_max_win,
}
