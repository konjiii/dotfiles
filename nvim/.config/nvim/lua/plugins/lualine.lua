-- statusline
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(str)
                        return str:sub(1, 1)
                    end,
                },
            },
            lualine_b = {
                "branch",
                {
                    "filename",
                    file_status = true,
                    newfile_status = true,
                    path = 0,

                    shorting_target = 41,

                    symbols = {
                        modified = "[+]",
                        readonly = "[-]",
                        unnamed = "[No Name]",
                        newfile = "[New]",
                    },
                },
                "diagnostics",
            },
            lualine_c = { "filesize" },
            lualine_x = {
                "fileformat",
                {
                    "filetype",
                    colored = true,
                    icon_only = false,
                    icon = { align = "right" },
                },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {
            lualine_c = {
                {
                    "datetime",
                    style = "%y-%m-%d %H:%M:%S",
                },
            },
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    },
}
