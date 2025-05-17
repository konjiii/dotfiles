local wezterm = require("wezterm")
local sessionizer = {}

sessionizer.schema = {
    { label = "dotfiles", id = "./dotfiles" },
    Sessionizer.DefaultWorkspace({}),
    Sessionizer.AllActiveWorkspaces({}),
    Sessionizer.FdSearch(wezterm.home_dir .. "/mhome"),

    processing = Sessionizer.for_each_entry(function(entry)
        entry.label = entry.label:gsub(wezterm.home_dir .. "/", "")
    end),
}

return sessionizer
