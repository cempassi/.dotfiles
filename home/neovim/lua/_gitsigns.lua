local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	return
end

vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "diffAdded" })
vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "diffAdded" })
vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "diffAdded" })
vim.api.nvim_set_hl(0, "GitSignsChange", { link = "WarningMSG" })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "WarningMSG" })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "WarningMSG" })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "SpellBad" })

gitsigns.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelete = { text = "‾" },
		changedelete = { text = "x" },
	},
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	--current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
