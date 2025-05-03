-- configuration that handles the wezterm multiplexer
local wezterm = require("wezterm")
local act = wezterm.action

local multiplexing = {}

function multiplexing.apply_to_config(config)
	config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		-- splitting
		{
			mods = "LEADER|SHIFT",
			key = '"',
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER|SHIFT",
			key = "%",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- pane selection
		-- {
		-- 	mods = "CTRL",
		-- 	key = "k",
		-- 	action = act.ActivatePaneDirection("Up"),
		-- },
		-- {
		-- 	mods = "CTRL",
		-- 	key = "l",
		-- 	action = act.ActivatePaneDirection("Right"),
		-- },
		-- {
		-- 	mods = "CTRL",
		-- 	key = "j",
		-- 	action = act.ActivatePaneDirection("Down"),
		-- },
		-- {
		-- 	mods = "CTRL",
		-- 	key = "h",
		-- 	action = act.ActivatePaneDirection("Left"),
		-- },
		-- tabs
		{
			mods = "LEADER",
			key = "c",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		-- tab movement
		{
			mods = "ALT",
			key = "h",
			action = act.ActivateTabRelative(-1),
		},
		{
			mods = "ALT",
			key = "l",
			action = act.ActivateTabRelative(1),
		},
		-- tab swapping
		{
			mods = "SHIFT|ALT",
			key = "h",
			action = act.MoveTabRelative(-1),
		},
		{
			mods = "SHIFT|ALT",
			key = "l",
			action = act.MoveTabRelative(1),
		},
	}

	-- tab movement using numbers
	-- tabs go from 0-9
	-- key = tab: 1 = 0, 2 = 1, ..., 9 = 8, 0 = 9
	for i = 0, 9 do
		table.insert(config.keys, {
			mods = "ALT",
			key = tostring(i),
			action = act.ActivateTab((i - 1) % 10),
		})
	end

	-- pane selection using smart_splits
	SmartSplits.apply_to_config(config, {
		direction_keys = {
			move = { "h", "j", "k", "l" },
			resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
		},
		modifiers = { move = "CTRL", resize = "META" },
	})
end

return multiplexing
