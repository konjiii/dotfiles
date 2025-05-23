-- fuzzy finder
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<leader>ts", builtin.treesitter)
    end,
}
