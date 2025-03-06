-- setup language servers.
local lspconfig = require("lspconfig")
-- configure pyright
-- lspconfig.pyright.setup({
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				PythonPlatform = "Linux",
-- 				-- typeCheckingMode = "off",
-- 				-- reportGeneralTypeIssues = "none",
-- 				strictListInference = true,
-- 				strictDictionaryInference = true,
-- 				strictSetInference = true,
-- 				autoImportCompletions = true,
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "workspace", -- or "openFilesOnly"
-- 				typeCheckingMode = "basic", -- or "off", "basic", "strict"
-- 				useLibraryCodeForTypes = true,
-- 			},
-- 		},
-- 	},
-- 	single_file_support = false, -- Set this to false to disable single file mode
-- })

-- rust_analyzer lsp configuration
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})

-- lua_ls config
lspconfig.lua_ls.setup({
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
					"${3rd}/love2d/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
