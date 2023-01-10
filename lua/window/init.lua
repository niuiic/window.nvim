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

local get_win_config = function(width_ratio, height_ratio)
	local cur_win_zindex = vim.api.nvim_win_get_config(0).zindex or 1
	local screen_w = vim.opt.columns:get()
	local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
	local window_w = screen_w * width_ratio
	local window_h = screen_h * height_ratio
	local window_w_int = math.floor(window_w)
	local window_h_int = math.floor(window_h)
	local center_x = (screen_w - window_w) / 2
	local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
	return {
		relative = "editor",
		row = center_y,
		col = center_x,
		width = window_w_int,
		height = window_h_int,
		border = "single",
		zindex = cur_win_zindex,
	}
end

local open_float_win = function()
	if is_float_win_open() then
		return
	end
	local win_config = get_win_config(1, 1)
	winnr = vim.api.nvim_open_win(0, true, win_config)
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
