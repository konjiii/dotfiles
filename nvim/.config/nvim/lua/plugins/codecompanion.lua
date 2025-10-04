return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        strategies = {
            chat = {
                adapter = {
                    name = "copilot",
                    model = "claude-sonnet-4",
                },
            },
        },
        memory = {
            opts = {
                chat = {
                    enabled = true,
                },
            },
        },
        display = {
            chat = {
                window = {
                    width = 0.4,
                },
            },
        },
    },
    keys = {
        { "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", mode = "n" },
        { "<localleader>a", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat", mode = "n" },
        { "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Code Companion Add", mode = "v" },
    },
}
