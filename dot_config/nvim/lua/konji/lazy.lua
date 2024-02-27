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
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.3",
        -- or                            , branch = "0.1.x",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "catppuccin/nvim", name = "catppuccin" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    { "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    "mbbill/undotree",
    "tpope/vim-fugitive",
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
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    "lukas-reineke/indent-blankline.nvim",
    "hiphish/rainbow-delimiters.nvim",
    "lervag/vimtex",
    "github/copilot.vim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    "lewis6991/gitsigns.nvim",
    "tpope/vim-rhubarb",
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        ft = { "rust" },
    },
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     opts = {},
    -- },
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
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
}

local opts = {}

require("lazy").setup(plugins, opts)
