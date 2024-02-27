require("oil").setup({
    delete_to_trash = true,
    keymaps = {
        ["-"] = "actions.parent",
        ["<C-p>"] = "actions.preview",
        ["<C-t>"] = "actions.toggle_trash",
        ["J"] = "actions.preview_scroll_down",
        ["K"] = "actions.preview_scroll_up",
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
    },
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    use_default_keymaps = false,
    view_options = {
        show_hidden = true,
    },
})
