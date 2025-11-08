-- inlay diagnostics instead of at end of line
vim.diagnostic.config({
    virtual_lines = { current_line = true },
    virtual_text = { current_line = false },
    underline = true,
})

-- -- turn on inlay hints
-- vim.lsp.inlay_hint.enable()
