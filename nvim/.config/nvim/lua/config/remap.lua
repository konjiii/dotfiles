vim.g.mapleader = " "

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
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>x", '"+x')

-- delete without yanking
vim.keymap.set("v", "d", '"_d')

-- select all text (and keep cursor where it was)
vim.keymap.set("n", "<C-a>", "ggVG")

-- save file while in insert mode
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>a")

-- undo and redo while while in insert mode
vim.keymap.set("i", "<C-z>", "<ESC>ua")
vim.keymap.set("i", "<C-y>", "<ESC><C-r>a")

-- skip to end or beginning of line in normal and visual mode
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "L", "$h")
vim.keymap.set("v", "H", "^")

-- find and replace in whole file (" rpf") or in current line (" rpl") or in current selection (" rps")
vim.keymap.set("n", "<leader>rpa", ":%s//gc<left><left><left>")
vim.keymap.set("n", "<leader>rpl", ":s//gc<left><left><left>")
vim.keymap.set("v", "<leader>rps", ":s//gc<left><left><left>")
