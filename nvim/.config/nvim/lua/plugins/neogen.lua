-- docstring generation plugin
return {
    "danymat/neogen",
    config = true,
    opts = {
        snippet_engine = "luasnip",
    },
    keys = {
        {
            "<leader>ng",
            function()
                require("neogen").generate()
            end,
            desc = "Generate docstring",
        },
    },
}
