vim.opt_local.wrap = true

-- j->gj and k->gk to navigate wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

