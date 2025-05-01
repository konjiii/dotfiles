-- Pull in the wezterm API
local wezterm = require("wezterm")
-- import module configs
local looks = require("looks")
local font = require("font")

local config = wezterm.config_builder()

-- apply module configs
looks.apply_to_config(config)
font.apply_to_config(config)

return config
