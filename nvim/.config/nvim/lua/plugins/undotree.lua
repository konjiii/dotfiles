-- file history and undo tree
return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}
