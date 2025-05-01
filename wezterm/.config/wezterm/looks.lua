local wezterm = require("wezterm")

local looks = {}

function looks.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.hide_tab_bar_if_only_one_tab = true
end

return looks
