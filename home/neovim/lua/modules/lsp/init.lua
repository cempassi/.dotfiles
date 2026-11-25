require("lspconfig")
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

--lspconfig.ts_ls.setup({
--	capabilities = capabilities,
--	filetypes = { "javascript", "typescript", "typescriptreact" },
--	on_attach = custom_on_attach,
--	cmd = { "typescript-language-server", "--stdio" },
--	autostart = true,
--	init_options = {
--		tsserver = {
--			path = tsserver_path,
--		},
--	},
--})
--
--lspconfig.html.setup({
--	on_attach = custom_on_attach,
--	capabilities = capabilities,
--})
--
--lspconfig.cssls.setup({
--	on_attach = custom_on_attach,
--	capabilities = capabilities,
--})
--lspconfig.clangd.setup({
--	on_attach = custom_on_attach,
--	capabilities = capabilities,
--	cmd = {
--		"clangd",
--		"--background-index",
--		"--suggest-missing-includes",
--		"--clang-tidy",
--		--"--header-insertion=iwyu",
--	},
--	init_options = {
--		clangdFileStatus = true,
--	},
--})
