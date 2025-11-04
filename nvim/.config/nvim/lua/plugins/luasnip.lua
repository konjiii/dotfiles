return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
    end,
    keys = {
        {
            "<C-J>",
            function()
                require("luasnip").expand()
            end,
            mode = { "i" },
            desc = "Expand or jump in a snippet",
        },
        {
            "<C-L>",
            function()
                require("luasnip").jump(1)
            end,
            mode = { "i", "s" },
            desc = "Jump forward in a snippet",
        },
        {
            "<C-H>",
            function()
                require("luasnip").jump(-1)
            end,
            mode = { "i", "s" },
            desc = "Jump backward in a snippet",
        },
        {
            "<C-E>",
            function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
            mode = { "i", "s" },
        },
    },
}
