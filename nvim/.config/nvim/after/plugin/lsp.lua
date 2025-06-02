local lsp_zero = require("lsp-zero")

-- setup lsp-zero
lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "<leader>gr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>se", function()
        vim.diagnostic.open_float()
    end, opts)
end)

-- setup mason
require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
    ensure_installed = {
        -- "zls",
        -- "lua_ls",
        -- "clangd",
        -- "pyright",
        -- "bashls",
        -- "gopls",
        -- "rust_analyzer",
        -- "texlab",
        -- "asm_lsp",
        -- "svelte",
        -- "ts_ls",
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
})

-- setup nvim-cmp
local cmp = require("cmp")
-- for vscode like icons
local lspkind = require("lspkind")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
    },
    formatting = {
        format = lspkind.cmp_format({
            -- defines how annotations are shown
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = "symbol_text",
            maxwidth = {
                -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                abbr = 50,
            },
            ellipsis_char = "...",
            show_labelDetails = false,

            -- The function below will be called before any actual modifications from lspkind
            before = function(_, vim_item)
                -- remove labelDetails CUZ show_labelDetails = false DOES NOT WORK
                vim_item.menu = ""

                return vim_item
            end,
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<Enter>"] = cmp.mapping.confirm({ select = false }),
    }),
})

-- setup vim-dadbod-completion
cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
    sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
    },
})

-- inlay diagnostics instead of at end of line
vim.diagnostic.config({
    virtual_lines = { current_line = true },
    virtual_text = { current_line = false },
    underline = true,
})

-- turn on inlay hints
-- vim.lsp.inlay_hint.enable()
