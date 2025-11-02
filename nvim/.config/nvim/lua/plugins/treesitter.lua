-- treesitter for better syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
        ensure_installed = { "markdown_inline", "regex", "vim", "vimdoc", "query", "python" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "vimdoc", "latex" },
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "python", "ocaml" },
        },
    },
}
