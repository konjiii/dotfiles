-- mason-lspconfig configuration
return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "zls",
            "lua_ls",
            "clangd",
            "pyright",
            "bashls",
            "gopls",
            "rust_analyzer",
            "texlab",
            "asm_lsp",
            "svelte",
            "ts_ls",
            -- only lsps can be ensure installed
            -- "stylua",
            -- "cpptools",
            -- "debugpy",
            -- "shfmt",
            -- "texfmt",
            -- "bibtex-tidy",
            -- "asmfmt",
            -- "prettier",
        },
    },
}
