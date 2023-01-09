local window = require("window")

vim.api.nvim_create_user_command("ToggleMaxWin", function()
	window.toggle_max_win()
end, {})
