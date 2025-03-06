vim.opt.nu = true -- current line number
vim.opt.relativenumber = true -- relative line numbers

vim.opt.tabstop = 4 -- 1 tab = 4 spaces
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- use spaces instead of tabs

vim.opt.smartindent = true -- autoindent new lines

vim.opt.wrap = false -- don't wrap lines

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true -- highlight all instances of search
vim.opt.incsearch = true -- search as you type

vim.opt.termguicolors = true -- enable 24-bit RGB colors

vim.opt.scrolloff = 8 -- keep 8 lines above/below cursor
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80" -- highlight column 80

vim.g.mapleader = " " -- set leader key to space

vim.opt.spell = true -- enable spell checking

-- turn on inlay hints
-- vim.lsp.inlay_hint.enable()
