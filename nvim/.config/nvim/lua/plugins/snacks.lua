-- display images inside neovim
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        image = { enabled = true },
        bigfile = { enabled = true },
        indent = { enabled = true },
        quickfile = { enabled = true },
        picker = { enabled = true },
    },
    keys = {
        {
            "<leader>ff",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>rg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Rip Grep",
        },
    },
}
