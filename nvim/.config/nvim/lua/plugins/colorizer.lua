-- highlight colorcodes like #f283f1
return {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
        require("colorizer").setup()
    end,
    opts = {},
}
