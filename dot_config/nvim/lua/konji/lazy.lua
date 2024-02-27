local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.3",
        -- or                            , branch = "0.1.x",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    -- theme for neovim
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- theme for neovim
    { "catppuccin/nvim", name = "catppuccin" },
    -- treesitter for better syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- for viewing the treesitter tree
    "nvim-treesitter/playground",
    -- quick switch between buffers
    { "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    -- file history and undo tree
    "mbbill/undotree",
    -- git integration
    "tpope/vim-fugitive",
    -- to setup lsp's
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- LSP Support
            {"neovim/nvim-lspconfig"},
            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"L3MON4D3/LuaSnip"},
        }
    },
    -- ctrl+/ to comment out block of code
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    -- indentation guides
    "lukas-reineke/indent-blankline.nvim",
    -- colorful brackets
    "hiphish/rainbow-delimiters.nvim",
    -- for latex support
    "lervag/vimtex",
    -- copilot
    "github/copilot.vim",
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    -- for showing git changes in the sign column
    "lewis6991/gitsigns.nvim",
    -- for directly going to the github repository
    "tpope/vim-rhubarb",
    -- rust tools
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    -- rust tools
    {
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        ft = { "rust" },
    },
    -- -- autopairs
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     opts = {},
    -- },
    -- file explorer oil
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    -- -- database explorer dadbod
    -- {
    --     "kristijanhusak/vim-dadbod-ui",
    --     dependencies = {
    --         { "tpope/vim-dadbod", lazy = true },
    --         { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "db" }, lazy = true },
    --     },
    --     cmd = {
    --         "DBUI",
    --         "DBUIToggle",
    --         "DBUIAddConnection",
    --         "DBUIFindBuffer",
    --     },
    --     init = function()
    --         -- dbui config
    --         vim.g.db_ui_use_nerd_fonts = 1
    --     end,
    -- },
}

local opts = {}

require("lazy").setup(plugins, opts)
