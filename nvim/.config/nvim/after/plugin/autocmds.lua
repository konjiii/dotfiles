-- configuration of various autocmds

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "markdown" },
    callback = function()
        vim.schedule(function()
            -- j->gj and k->gk to navigate wrapped lines
            vim.keymap.set({ "n", "v" }, "j", "gj")
            vim.keymap.set({ "n", "v" }, "k", "gk")

            -- skip to end or beginning of line in normal and visual mode
            vim.keymap.set("n", "L", "g$")
            vim.keymap.set("n", "H", "g^")
            vim.keymap.set("v", "L", "g$")
            vim.keymap.set("v", "H", "g^")
        end)
    end,
})
