-- lazydev: proper luaLS configuration for editing neovim config
return {
    "folke/lazydev.nvim",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            "nvim-dap-ui",
        },
    },
}
