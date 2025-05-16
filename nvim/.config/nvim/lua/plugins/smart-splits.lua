-- seamless navigation between nvim and wezterm panes
return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    -- stylua: ignore
    keys = {
        { "<C-h>", function() require("smart-splits").move_cursor_left() end },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end },
    },
}
