-- Tree-sitter configuration
--
local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:prepend(parser_install_dir)

require("nvim-treesitter.").setup({
	install_dir = parser_install_dir,
})
