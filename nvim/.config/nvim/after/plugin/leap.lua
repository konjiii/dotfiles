-- nvim leap keybinds
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

require("leap.user").set_repeat_keys("<enter>", "<backspace>")
require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
-- require("leap").opts.safe_labels = {}
