function ColorMyPencils()
    require("catppuccin").setup({
        flavour = "mocha",
        show_end_of_buffer = true,
        integrations = {
            indent_blankline = {
                enabled = true,
                scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                colored_indent_levels = true,
            },
            harpoon = true,
            mason = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            treesitter = true,
            telescope = {
                enabled = true,
                -- style = "nvchad"
            },
            rainbow_delimiters = true,
        },
    })
    vim.cmd.colorscheme "catppuccin"
end

ColorMyPencils()
