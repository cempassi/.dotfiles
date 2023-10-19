local lspconfig = require("lspconfig")
local api = vim.api

-- Load submodule
require("modules.lsp._diagnostic")
require("lspconfig.ui.windows").default_options.border = "single"

local custom_on_attach = function(client, bufnr)
	--- Load mappings defined by which-key per buffer
	require("_which-key").lsp()

	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Servers Configuration --
lspconfig.yamlls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	root_dir = vim.loop.cwd,

	settings = {
		yaml = {
			hover = true,
			completion = true,
			validate = true,
			schemaStore = {
				enable = true,
			},
			schemas = {
				'https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json: "*.gitlab-ci.yml"',
			},
			customTags = { "!reference", "!Ref" },
		},
	},
})

lspconfig.vimls.setup({})

lspconfig.taplo.setup({
	on_attach = custom_on_attach,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "typescriptreact" },
	on_attach = custom_on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	autostart = true,
	init_options = {
		tsserver = {
			path = tsserver_path,
		},
	},
})

lspconfig.html.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = custom_on_attach,
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
	capabilities = capabilities,
})

lspconfig.vuels.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = custom_on_attach,
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

lspconfig.lua_ls.setup({
	cmd = { "lua-language-server" },
	on_attach = custom_on_attach,
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
					"tsserver_path",
					"jdtls_path",
          "lua",
          "lombok_path"
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
	capabilities = capabilities,
})

lspconfig.rnix.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})
