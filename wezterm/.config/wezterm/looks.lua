-- configuration that changes the looks of wezterm
local looks = {}

local function get_theme()
	local theme_file = io.open(os.getenv("HOME") .. "/.theme", "r")
	if theme_file == nil then
		return "Catppuccin Mocha"
	end
	local contents = theme_file:read("*a")
	theme_file:close()

	-- pattern of theme name
	local pattern = '"[a-zA-Z ()-]+"'

	-- get line with wezterm=...
	local idx, idx2 = string.find(contents, "wezterm=" .. pattern)
	if idx == nil then
		return "Catppuccin Mocha"
	end
	contents = string.sub(contents, idx, idx2)

	-- get part inside ""
	idx, idx2 = string.find(contents, pattern)
	if idx == nil then
		return "Catppuccin Mocha"
	end
	contents = string.sub(contents, idx + 1, idx2 - 1)

	return contents
end

local function set_tab_bar()
	local env = os.getenv("WEZTERM_CLIPSE")

	if env == "true" then
		return false
	end

	return true
end

function looks.apply_to_config(config)
	config.color_scheme = get_theme()
	config.enable_scroll_bar = true
	config.enable_tab_bar = set_tab_bar()
end

return looks
