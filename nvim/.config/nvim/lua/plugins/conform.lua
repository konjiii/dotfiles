-- auto formatters
return {
    "stevearc/conform.nvim",
    init = function()
        require("conform").formatters.stylua = {
            prepend_args = { "--indent-type", "Spaces" },
        }
    end,
    opts = {
        format_after_save = {},
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            sh = { "shfmt" },
            svelte = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            zig = { "zigfmt" },
        },
    },
}
