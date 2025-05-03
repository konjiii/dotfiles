-- configuration that dictates the font
local wezterm = require("wezterm")

local font = {}

function font.apply_to_config(config)
	config.font = wezterm.font("JetBrains Mono")
	config.font_size = 15
	config.harfbuzz_features = { "calt=0", "zero" }
end

return font
