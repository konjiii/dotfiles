-- quick switch between buffers
return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- stylua: ignore
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
        { "<leader>1", function() require("harpoon"):list():select(1) end },
        { "<leader>2", function() require("harpoon"):list():select(2) end },
        { "<leader>3", function() require("harpoon"):list():select(3) end },
        { "<leader>4", function() require("harpoon"):list():select(4) end },
        { "<leader>5", function() require("harpoon"):list():select(5) end },
        { "<leader>6", function() require("harpoon"):list():select(6) end },
        { "<leader>7", function() require("harpoon"):list():select(7) end },
        { "<leader>8", function() require("harpoon"):list():select(8) end },
        { "<leader>9", function() require("harpoon"):list():select(9) end }
    }
,
}
