return {
    -- themes for neovim
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = { show_end_of_buffer = true },
    },
    { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
    { "morhetz/gruvbox", priority = 1000 },
    { "sainnhe/everforest", priority = 1000 },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000 },
}
