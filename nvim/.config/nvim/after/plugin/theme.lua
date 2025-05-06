-- catppuccin
require("catppuccin").setup({
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	highlight_overrides = {
		mocha = function(mocha)
			return {
				LineNr = { fg = mocha.overlay1 },
				CmpBorder = { fg = mocha.overlay1 },
			}
		end,
	},
	default_integrations = true,
	integrations = {
		gitsigns = true,
		treesitter = true,
		harpoon = true,
		mason = true,
		rainbow_delimiters = true,
		dap = true,
		dap_ui = true,
		indent_blankline = {
			enabled = true,
			scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		telescope = {
			enabled = true,
		},
	},
})

local function get_theme()
	local theme_file = io.open(os.getenv("HOME") .. "/.theme", "r")
	if theme_file == nil then
		return ""
	end
	local contents = theme_file:read("*a")
	theme_file:close()

	-- pattern of theme name
	local pattern = '"[a-zA-Z ()-]+"'

	-- get line with neovim=...
	local idx, idx2 = string.find(contents, "neovim=" .. pattern)
	if idx == nil then
		return ""
	end
	contents = string.sub(contents, idx, idx2)

	-- get part inside ""
	idx, idx2 = string.find(contents, pattern)
	if idx == nil then
		return ""
	end
	contents = string.sub(contents, idx + 1, idx2 - 1)

	return contents
end

local theme = get_theme()
vim.cmd.colorscheme(theme)
