-- Pull in the wezterm API
local wezterm = require("wezterm")
-- plugins
require("plugins")

-- import module configs
local looks = require("looks")
local font = require("font")
local multiplexing = require("multiplexing")

local config = wezterm.config_builder()

-- apply module configs
looks.apply_to_config(config)
font.apply_to_config(config)
multiplexing.apply_to_config(config)

return config
