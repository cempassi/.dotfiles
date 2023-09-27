-- Tree-sitter configuration
--
local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:prepend(parser_install_dir)

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"rust",
    "python",
		"hcl",
    "javascript",
    "typescript",
    "bash",
    "git_rebase",
    "markdown",
    "toml",
    "json",
    "dockerfile",
    "make",
    "svelte",
    "scss",
    "sql",
    "http",
    "css",
    "yaml",
    "vue",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	parser_install_dir = parser_install_dir,
	highlight = {
		enable = true, -- false will disable the whole extension
		use_languagetree = false, -- Use this to enable language injection (this is very unstable)
		disable = {}, -- list of language that will be disabled
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
})
