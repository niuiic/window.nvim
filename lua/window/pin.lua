local pin = function()
	local core = require("core")
	local win_config = vim.api.nvim_win_get_config(0)
	if win_config.relative == "" then
		vim.notify("Unable to pin non-floating window", vim.log.levels.ERROR)
		return
	end
    local bufnr = vim.api.nvim_win_get_buf(0)
	core.win.open_float(bufnr, win_config)
end

return {
	pin = pin,
}
