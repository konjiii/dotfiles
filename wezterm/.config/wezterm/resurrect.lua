-- resurrect setup
local wezterm = require("wezterm")

Resurrect.state_manager.periodic_save({
	interval_seconds = 5,
	save_workspaces = true,
})

wezterm.on("gui-startup", Resurrect.state_manager.resurrect_on_gui_startup)
