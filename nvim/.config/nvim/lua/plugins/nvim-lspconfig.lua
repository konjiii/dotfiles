-- LSP configuration for neovim
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.lsp.enable("rust_analyzer") -- rust
        vim.lsp.enable("lua_ls") -- lua
        vim.lsp.enable("bashls") -- bash
        vim.lsp.enable("gopls") -- go
        vim.lsp.enable("zls") -- zig
        vim.lsp.enable("pyright") -- python
        vim.lsp.enable("clangd") -- c
        vim.lsp.enable("svelte") -- svelte
        vim.lsp.enable("ts_ls") -- typescript
        vim.lsp.enable("expert") -- elixir
        vim.lsp.enable("gleam") -- gleam
    end,
    keys = {
        { "<leader>rn", vim.lsp.buf.rename, desc = "LSP Rename" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action" },
        { "<leader>gd", vim.lsp.buf.definition, desc = "LSP Go to Definition" },
        { "<leader>gr", vim.lsp.buf.references, desc = "LSP Go to References" },
        { "<leader>se", vim.diagnostic.open_float, desc = "LSP Show Error" },
    },
}
