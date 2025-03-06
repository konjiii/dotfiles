require("conform").setup({
	format_after_save = {},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		ocaml = { "ocamlformat" },
		sh = { "shfmt" },
		svelte = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
	},
})
