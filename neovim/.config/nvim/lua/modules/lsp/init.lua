local lspconfig = require("lspconfig")
local api = vim.api

require("modules.lsp._diagnostic") -- diagnostic stuff

require("lspsaga").init_lsp_saga({
	border_style = "single",
}) -- initialise lspsaga UI

local custom_on_attach = function(client, bufnr)
	--- Load mappings defined by which-key per buffer
	require("_which-key").lsp()

	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local custom_on_init = function()
	print("Language Server Protocol started!")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Servers Configuration --

lspconfig.yamlls.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
	root_dir = vim.loop.cwd,
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
			},
		},
	},
})

lspconfig.vimls.setup({
	on_attach = custom_on_attach,
})

lspconfig.tsserver.setup({
	filetypes = { "javascript", "typescript", "typescriptreact" },
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	root_dir = vim.loop.cwd,
})

lspconfig.jdtls.setup({
	cmd = { "jdtls" },
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	settings = {
		java = {
			errors = {
				incompleteClasspath = {
					severity = "ignore",
				},
			},
		},
	},
})

lspconfig.html.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,

	settings = {
		["rust-analyzer"] = {
			assist = {
				importMergeBehaviour = "full",
			},

			callInfo = {
				full = true,
			},

			cargo = {
				loadOutDirsFromCheck = true,
			},

			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},

			procMacro = {
				enable = true,
			},
		},
	},
})

lspconfig.terraformls.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})

lspconfig.vuels.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--clang-tidy",
		--"--header-insertion=iwyu",
	},
	init_options = {
		clangdFileStatus = true,
	},
})

lspconfig.sumneko_lua.setup({
	cmd = { "lua-language-server" },
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	prefix = lua,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"describe",
					"it",
					"before_each",
					"after_each",
					"awesome",
					"theme",
					"client",
					"P",
					"use",
				},
				telemetry = {
					enable = false,
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})

lspconfig.rnix.setup({
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = capabilities,
})
