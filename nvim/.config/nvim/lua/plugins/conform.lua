-- auto formatters
return {
    "stevearc/conform.nvim",
    opts = {
        format_after_save = {},
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            sh = { "beautysh" },
            zsh = { "beautysh" },
            svelte = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            zig = { "zigfmt" },
            go = { "gofmt" },
            bib = { "bibtex-tidy" },
            tex = { "tex-fmt" },
            json = { "jq" },
            jsonc = { "prettier" },
            rust = { "rustfmt" },
            elixir = { "mix" },
            gleam = { "gleam" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
            ["tex-fmt"] = {
                prepend_args = { "-n" },
            },
        },
    },
}
