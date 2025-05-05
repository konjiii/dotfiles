-- configuration that changes the looks of wezterm
local looks = {}

function looks.apply_to_config(config)
	-- config.colors = Theme.colors()
	-- config.window_frame = Theme.window_frame()
	config.color_scheme = "Catppuccin Mocha"
	config.enable_scroll_bar = true
end

return looks
