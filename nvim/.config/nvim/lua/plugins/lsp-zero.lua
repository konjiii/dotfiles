-- to setup lsp's
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        --- Uncomment these if you want to manage LSP servers from neovim
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- LSP Support
        { "neovim/nvim-lspconfig" },
        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" }, -- path-completion
        { "L3MON4D3/LuaSnip" },
        -- vscode like lsp icons
        { "onsails/lspkind.nvim" },
    },
}
