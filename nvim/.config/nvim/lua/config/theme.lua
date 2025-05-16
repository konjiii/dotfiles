local function get_theme()
    local theme_file = io.open(os.getenv("HOME") .. "/.theme", "r")
    if theme_file == nil then
        return "catppuccin"
    end
    local contents = theme_file:read("*a")
    theme_file:close()

    -- pattern of theme name
    local pattern = '"[a-zA-Z ()-]+"'

    -- get line with neovim=...
    local idx, idx2 = string.find(contents, "neovim=" .. pattern)
    if idx == nil then
        return "catppuccin"
    end
    contents = string.sub(contents, idx, idx2)

    -- get part inside ""
    idx, idx2 = string.find(contents, pattern)
    if idx == nil then
        return "catppuccin"
    end
    contents = string.sub(contents, idx + 1, idx2 - 1)

    return contents
end

local theme = get_theme()
vim.cmd.colorscheme(theme)
