-- debugging
return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
        require("dapui").setup(opts)
    end,
    -- stylua: ignore
    keys = {
        { "<leader>b", function() require("dap").toggle_breakpoint() end },
        { "<leader>dap", function() require("dap").continue() end },
    },
}
