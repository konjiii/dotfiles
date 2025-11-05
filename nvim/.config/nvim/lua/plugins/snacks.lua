-- display images inside neovim
return {
    "folke/snacks.nvim",
    enabled = true,
    priority = 1000,
    ---@type snacks.Config
    opts = {
        image = {
            -- your image configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
