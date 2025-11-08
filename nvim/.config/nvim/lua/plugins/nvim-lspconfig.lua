-- LSP configuration for neovim
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.lsp.enable("rust_analyzer") -- rust_analyzer
        vim.lsp.enable("luals") -- lua-language-server
        vim.lsp.enable("bash_lsp") -- bash-language-server
        vim.lsp.enable("gopls") -- gopls
        vim.lsp.enable("zls") -- zls
        vim.lsp.enable("pyright") -- pyright
        vim.lsp.enable("clangd") -- clangd
        vim.lsp.enable("ocamllsp") -- ocamllsp
    end,
    keys = {
        { "<leader>rn", vim.lsp.buf.rename, desc = "LSP Rename" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action" },
        { "<leader>gd", vim.lsp.buf.definition, desc = "LSP Go to Definition" },
        { "<leader>gr", vim.lsp.buf.references, desc = "LSP Go to References" },
        { "<leader>se", vim.diagnostic.open_float, desc = "LSP Show Error" },
    },
}
