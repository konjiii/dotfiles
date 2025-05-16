-- remote connect from inside neovim
return {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
        require("distant"):setup()
    end,
}
