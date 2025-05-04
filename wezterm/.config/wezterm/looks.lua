-- configuration that changes the looks of wezterm
local looks = {}

function looks.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.enable_scroll_bar = true
end

return looks
