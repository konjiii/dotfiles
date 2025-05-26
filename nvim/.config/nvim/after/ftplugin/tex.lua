vim.opt_local.wrap = true

-- j->gj and k->gk to navigate wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- skip to end or beginning of line in normal and visual mode
vim.keymap.set("n", "L", "g$")
vim.keymap.set("n", "H", "g^")
vim.keymap.set("v", "L", "g$")
vim.keymap.set("v", "H", "g^")
