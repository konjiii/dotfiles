-- nvim completion

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" }, -- path-completion
        -- nvim-lspconfig
        { "neovim/nvim-lspconfig" },
        -- snippet engine
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
        -- vscode like lsp icons
        { "onsails/lspkind.nvim" },
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                -- for path completion
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
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
                    show_labeldetails = false,

                    -- the function below will be called before any actual modifications from lspkind
                    before = function(_, vim_item)
                        -- remove labeldetails cuz show_labeldetails = false does not work
                        vim_item.menu = ""
                        -- remove icon that lspkind itself also adds
                        vim_item.icon = ""

                        return vim_item
                    end,
                }),
            },
            mapping = cmp.mapping.preset.insert({
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
    end,
}
