vim.g.mapleader = " "
-- go to file explorer
vim.keymap.set("n", "<leader>dr", ":Oil<CR>")

-- move selected lines with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- indent/unindent multiple lines at once
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- delete enters without moving your position with J
vim.keymap.set("n", "J", "mzJ`z")

-- ctrl+d and ctrl+u (moving up and down half a page) while keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy and cut to windows clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>x", "\"+x")

-- paste and delete without yanking
vim.keymap.set("v", "d", "\"_d")
vim.keymap.set("v", "<leader>p", "\"0p")
vim.keymap.set("v", "<leader>P", "\"0P")

-- select all text (and keep cursor where it was)
vim.keymap.set("n", "<C-a>", "ggVG")

-- save file while in insert mode
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>a")

-- undo and redo while while in insert mode
vim.keymap.set("i", "<C-z>", "<ESC>ua")
vim.keymap.set("i", "<C-y>", "<ESC><C-r>a")

-- -- split terminal and run code
-- vim.keymap.set("n", "<leader>py", ":sp<CR><C-w>j:terminal python %<CR>i")
-- vim.keymap.set("n", "<leader>rs", ":sp<CR><C-w>j:terminal cargo run<CR>i")

-- skip to end or beginning of line in normal and visual mode
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "L", "$h")
vim.keymap.set("v", "H", "^")

-- move to other screen when screen was split
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- find and replace in whole file (" rpf") or in current line (" rpl") or in current selection (" rps")
vim.keymap.set("n", "<leader>rpf", ":%s//gc<left><left><left>")
vim.keymap.set("n", "<leader>rpl", ":s//gc<left><left><left>")
vim.keymap.set("v", "<leader>rps", ":s//gc<left><left><left>")
