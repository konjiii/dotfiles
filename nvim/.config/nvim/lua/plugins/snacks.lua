-- display images inside neovim
return {
    "folke/snacks.nvim",
    enabled = false,
    ---@type snacks.Config
    opts = {
        image = {
            -- your image configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
