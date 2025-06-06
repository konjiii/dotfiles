return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_general_viewer = "okular"
        vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

        vim.opt.conceallevel = 2
        vim.g.vimtex_syntax_conceal = {
            accents = 1,
            ligatures = 1,
            cites = 1,
            fancy = 1,
            spacing = 1,
            greek = 1,
            math_bounds = 1,
            math_delimiters = 1,
            math_fracs = 1,
            math_super_sub = 1,
            math_symbols = 1,
            sections = 1,
            styles = 1,
        }
    end,
}
