local conform = require("conform")

conform.formatters.stylua = {
    prepend_args = { "--indent-type", "Spaces" },
    -- The base args are { "-filename", "$FILENAME" } so the final args will be
    -- { "-i", "2", "-filename", "$FILENAME" }
}

conform.setup({
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
})
