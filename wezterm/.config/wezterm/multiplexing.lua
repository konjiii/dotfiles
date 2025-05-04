-- configuration that handles the wezterm multiplexer
local multiplexing = {}

function multiplexing.apply_to_config(config)
	-- domain definition
	config.unix_domains = {
		{ name = "default" },
	}
	config.default_gui_startup_args = { "connect", "default" }
end

return multiplexing
