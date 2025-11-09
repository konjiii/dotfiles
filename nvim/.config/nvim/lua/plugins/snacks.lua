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
    },
}
