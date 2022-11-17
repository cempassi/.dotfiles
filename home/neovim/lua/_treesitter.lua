-- Tree-sitter configuration
--
local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

require("nvim-treesitter.configs").setup({
	ensure_installed = {
    "c",
		"rust",
    "python",
		"hcl",
    "javascript",
    "typescript",
    "lua",
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
    "vim",
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

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.telekasten = "markdown"
