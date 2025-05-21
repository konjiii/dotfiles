return {
    "azorng/goose.nvim",
    branch = "main",
    config = function()
        require("goose").setup({})
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                anti_conceal = { enabled = false },
            },
        },
    },
    opts = {
        keymap = {
            global = {
                open_input = "<leader>gi", -- Opens and focuses on input window. Loads current buffer context
                open_output = "<leader>go", -- Opens and focuses on output window. Loads current buffer context
            },
            window = {
                submit = "<cr>", -- Submit prompt
                close = "<esc>", -- Close UI windows
            },
        },
        ui = {
            window_width = 0.35, -- Width as percentage of editor width
            input_height = 0.15, -- Input height as percentage of window height
            fullscreen = false, -- Start in fullscreen mode (default: false)
        },
    },
}
