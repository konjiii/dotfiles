-- file explorer oil
return {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        delete_to_trash = true,
        watch_for_changes = true,
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["<C-t>"] = { "actions.toggle_trash", mode = "n" },
            ["<ESC>"] = { "actions.close", mode = "n" },
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = true,
        },
    },
    -- stylua: ignore
    keys = {
        { "-", function() require("oil").open_float() end },
    },
}
