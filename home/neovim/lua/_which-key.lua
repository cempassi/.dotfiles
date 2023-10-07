local ok, key = pcall(require, "which-key")
if not ok then
	return
end

-- -- -- -- -- Settings -- -- -- -- --

key.setup({
	window = {
		border = "double", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 4, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
})

-- -- -- -- -- Global Mappings -- -- -- -- --

local register = key.register

-- Change escape to jk in all modes
register({ j = { name = "Escape", k = { "<esc>", "Insert" } } }, { mode = "i" })
register({ j = { name = "Escape", k = { "<C-c>", "Command" } } }, { mode = "c" })
register({ j = { name = "Escape", k = { "<esc>", "Visual" } } }, { mode = "v" })

register({ [";"] = { ":", "Semicolon as colon" } })
register({ [";"] = { ":", "Semicolon as colon" } }, { mode = "v" })
register({ [","] = { ";", "Next find or til'" } })
register({ [","] = { ";", "Next find or til'" } }, { mode = "v" })

-- Digraph mappings
register({
	[","] = {
		name = "Special characters (Digraph)",
		["."] = { "<C-K>", "Enter Digraph" },
		["?"] = { "<esc>:digraph<cr>", "List Digraphs" },
	},
}, { mode = "i" })

-- Unmap Normal mode keys
register({
	["<right>"] = { "<nop>", "Unmap right" },
	["<left>"] = { "<nop>", "Unmap left" },
	["<up>"] = { "<nop>", "Unmap up" },
	["<down>"] = { "<nop>", "Unmap down" },
	["Q"] = { "<nop>", "Unmap Q" },
})

-- Unmap Insert mode keys
register({
	["<right>"] = { "<nop>", "Unmap right" },
	["<left>"] = { "<nop>", "Unmap left" },
	["<up>"] = { "<nop>", "Unmap up" },
	["<down>"] = { "<nop>", "Unmap down" },
}, { mode = "i" })

-- Buffer Mappings
register({
	["<tab>"] = { ":bn<cr>", "Buffer next" },
	["<S-tab>"] = { ":bp<cr>", "Buffer previous" },
	["<leader>bd"] = { ":bp|bdelete! #<cr>", "Buffer delete" },
	["<leader>nh"] = { ":noh<CR>", "No Highlights" },
})

-- Navigation Mappings
register({
	name = "Window movements",
	h = { ":wincmd h<CR>", "Move left window" },
	j = { ":wincmd j<CR>", "Move down window" },
	k = { ":wincmd k<CR>", "Move up window" },
	l = { ":wincmd l<CR>", "Move right window" },
}, { prefix = "<leader>" })

-- Window Maniplation
register({
	name = "Window maniplation",
	H = { "<C-w>K", "Shift to Horizontal" },
	V = { "<C-w>H", "Shift to Vertical" },
	[">"] = { "<C-w>r", "Rotate right" },
	["<"] = { "<C-w>R", "Rotate left" },
	["<BS>"] = { "<C-w><C-x>", "Swap windows" },
	["="] = { "<C-w>=", "Balance windows" },
	["0"] = { "<C-w>o", "Focus on current window" },
	["|"] = { ":vsplit<cr>", "Split Verticaly" },
	["_"] = { ":split<cr>", "Split Horizontaly" },
}, { prefix = "<leader>" })

-- Save and quit
register({
	name = "Save and Quit",
	x = { ":x<cr>", "Save and close (Buffer)" },
	X = { ":xa<cr>", "Save and close (All)" },
	w = { ":w<cr>", "Save (Buffer)" },
	W = { ":wa<cr>", "Save (All)" },
	q = { ":q<cr>", "Close (Buffer)" },
	Q = { ":qa!<cr>", "Close (All)" },
}, { prefix = "<leader>" })

-- TreeSitter
register({
	I = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Show Highlight" },
})

-- Dashboard (Start plugin)
register({
	["fh"] = { ":DashboardFindHistory<CR>", "Find history" },
	["f<leader>"] = { ":DashboardFindFile<CR>", "Find file" },
	["fc"] = { ":DashboardChangeColorscheme<CR>", "Change Colorscheme" },
	["fb"] = { ":DashboardJumpMark<CR>", "List jump marks" },
	["e."] = { ":DashboardNewFile<CR>", "Open new buffer" },
}, { prefix = "<leader>" })

-- Persisted (Session manager)
register({
	["ss"] = { ":<cmd>SessionStart<CR>", "Save session" },
	["sl"] = { ":<cmd>SessionLoad<CR>", "Load session" },
}, { prefix = "<leader>" })

-- Go to Previous
register({
	["["] = {
		name = "Previous",
		p = { "<C-^>", "Buffer" },
		j = { "<c-o>", "Jumplist" },
		c = { "g;", "Change list" },
		q = { ":cprevious<cr>", "Quickfix list" },
		g = { ":Gitsigns prev_hunk<cr>", "Git Hunk" },
		t = { ":FloatermPrev<CR>", "Terminal" },
		e = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
	},
})

-- Go to Next
register({
	["]"] = {
		name = "Next",
		q = { ":cnext<cr>", "Quickfix list" },
		j = { "<c-i>", "Jump list" },
		c = { "g,", "Change list" },
		g = { ":Gitsigns next_hunk<cr>", "Git Hunk" },
		t = { ":FloatermNext<CR>", "Terminal" },
		e = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Next Diagnostic" },
	},
})

-- Telescope
register({
	name = "Telescope",
	["f<leader>"] = { "<cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>", "List Files" },
	["F<leader>"] = { "<cmd>Telescope oldfiles<CR>", "List Old files" },
	["."] = {
		"<cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git cwd=~/.dotfiles<CR>",
		"List Dotfiles",
	},
	["/"] = { "<cmd>Telescope live_grep<CR>", "List Word" },
	["?"] = { "<cmd>Telescope help_tags<CR>", "List Help" },
	["[<leader>"] = { "<cmd>Telescope quickfix<cr>", "Show Quickfix" },
	["]<leader>"] = { "<cmd>Telescope loclist<cr>", "Show Loclist" },
	["b<leader>"] = { "<cmd>Telescope buffers<cr>", "Show Loclist" },
	["g<leader>"] = { "<cmd>Telescope git_status<CR>", "Git Status" },
	["e<leader>"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer Diagnostics" },
	["E<leader>"] = { "<cmd>Telescope diagnostics<CR>", "All Diagnostics" },
	["n<leader>"] = { " <cmd>Telescope notify<CR>", "List notifications" },
	["s<leader>"] = { "<cmd>Telescope persisted<CR>", "List Sessions" },
}, { prefix = "<leader>" })

-- Debugger
register({
	name = "Debugger",
	s = { require("dap").step_over, "Step Over" },
	i = { require("dap").step_into, "Step Into" },
	o = { require("dap").step_out, "Step Out" },
	c = { require("dap").continue, "Continue" },
	b = { require("dap").toggle_breakpoint, "Toogle Breakpoint" },
	l = { require("dap").set_breakpoint, "Set Log point" },
	r = { require("dap").repl.open, "Open repl" },
}, { prefix = "<leader>d" })

-- Tasks
register({
	name = "Tasks",
	k = { ":AsyncTask build<cr>", "Build" },
	K = { ":AsyncTask debug<cr>", "Build in debug" },
	c = { ":AsyncTask clean<cr>", "Clean" },
	r = { ":AsyncTask run<cr>", "Run" },
	R = { ":AsyncTask run-debug<cr>", "Run in debug" },
	t = { ":AsyncTask test<cr>", "Test" },
	l = { ":AsyncTask lint<cr>", "Check Errors (Lint)" },
	e = { ":AsyncTask -e<cr>", "Edit local tasks" },
	E = { ":AsyncTask -E<cr>", "Edit global tasks" },
}, { prefix = "<leader>m" })

-- Glow
register({
	["<leader>a"] = { ":Glow<CR>", "Preview Markdown" },
	["<bs>"] = { ":edit #<cr>", "Previous Markdown Link" },
})

-- Floaterm
register({
	["tc"] = { ":FloatermNew<CR>", "Create new Terminal" },
	["<leader>"] = { ":FloatermToggle<CR>", "Toggle Terminal" },
}, { prefix = "<leader>" })

-- TODO: Adapt Gh cli commands to work with gitlab too
-- " Git
-- nmap <leader>p<leader> <cmd>Telescope gh pull_request<CR>
--
-- "Gh (Github cli integration, needs gh and nvr instaled)
-- nmap <silent><leader>gp :AsyncTask pr-create<cr>
-- nmap <silent><leader>gm :AsyncTask pr-merge<cr>
-- nmap <silent><leader>gw :AsyncTask pr-watch<cr>
--
--Git
register({
	g = {
		name = "Git",
		a = { ":Git add %<cr>", "Stage File" },
		A = { ":Git add --all<cr>", "Stage all files" },
		s = { ":Gitsigns stage_hunk<cr>", "Stage Hunk" },
		["<Enter>"] = { ":Git commit <cr>", "Create commit" },
		["<BS>"] = { ":Git commit --amend --no-edit<cr>", "Amend commit" },
		u = { ":Gitsigns undo_stage_hunk<cr>", "Undo Hunk" },
		U = { ":Git restore %<cr>", "Undo changes (restore file)" },
		h = { ":Gitsigns toggle_linehl<cr>", "Toggle git lines highlight" },
		H = { ":Gcd<cd>", "cd to git root" },
		["["] = { "<cmd>FloatermNew --disposable git pull<cr>", "Pull" },
		["]"] = { "<cmd>FloatermNew --disposable git push<cr>", "Push" },
		["l<leader>"] = { "<cmd>FloatermNew --disposable git ls<cr>", "List 10 last commits" },
		r = { ":GRename %", "Rename file" },
		["?"] = { ":Gitsigns preview_hunk<cr>", "Hunk preview" },
		g = { ":Gitsigns toggle_signs<cr>", "Hunk Toogle" },
		n = { ":Gitsigns toggle_numhl<cr>", "Hunk Toogle" },
		k = { " <Plug>(git-messenger)", "Hunk Info" },
	},
	G = {
		name = "Git",
		["<Enter>"] = { ":Git commit --all<cr>", "Create commit with all files" },
		["<BS>"] = { ":Git commit --all --amend --no-edit<cr>", "Add all modified files to previous commit" },
		["["] = { "<cmd>FloatermNew --disposable git pull -f<cr>", "Pull force" },
		["]"] = { "<cmd>FloatermNew --disposable git push -f<cr>", "Push force" },
		["<leader>"] = { "<cmd>FloatermNew --disposable git status<cr>", "Status" },
	},
	B = {
		name = "Git",
		["<leader>"] = { "<cmd>Telescope git_branches<CR>", "List branches" },
	},
	--c = {
	--	name = "Git",
	--	["<leader>"] = { "<cmd>Telescope git_commits<CR>", "List commits" },
	--},
	v = {
		name = "Git",
		["<leader>"] = { "<cmd>Telescope git_commits<CR>", "List buffer commits (version)" },
	},
}, { prefix = "<leader>" })

-- LuaSnip
register({
	["<c-]>"] = { "<cmd>lua require'luasnip'.jump(1)<CR>", "Next Snippet Comp" },
	["<c-[>"] = { "<cmd>lua require'luasnip'.jump(-1)<CR>", "Prev Snippet Comp" },
}, { mode = "i" })

register({
	["<c-]>"] = { "<cmd>lua require'luasnip'.jump(1)<CR>", "Next Snippet Comp" },
	["<c-[>"] = { "<cmd>lua require'luasnip'.jump(-1)<CR>", "Prev Snippet Comp" },
}, { mode = "s" })

-- -- -- -- -- Filetype Mappings -- -- -- -- --
-- Telekasten
local function attach_telekasten()
	register({
		n = {
			name = "Telekasten",
			n = { ":lua require('telekasten').follow_link()<CR>", "Follow link" },
			["<leader>"] = { ":lua require('telekasten').find_notes()<CR>", "Find note" },
			["<enter>"] = { ":lua require('telekasten').new_note()<CR>", "Create new note" },
		},
	}, { prefix = "<leader>", buffer = 0 })
end

-- Diagnostic
register({
	c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Cursor Diagnostic" },
	l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostic" },
	b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Buffer Diagnostic" },
	w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace Diagnostic" },
}, { prefix = "<leader>e" })

-- LSP
local function attach_normal_leader_lsp()
	register({
		c = {
			name = "Lsp",
			n = { vim.lsp.buf.rename, "Rename Reference" },
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
      v = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
			f = { vim.lsp.buf.format, "Format Code" },
			r = { "<cmd>Telescope lsp_references<cr>", "Lsp References" },
			s = { vim.lsp.buf.signature_help, "Signature Help" },
			i = { vim.lsp.buf.type_definition, "Preview definition" },
			d = { vim.lsp.buf.definition, "Go to Definition" },
			D = { vim.lsp.buf.declaration, "Go to Declaration" },
		},
	}, { prefix = "<leader>", buffer = 0 })
end

local function attach_lsp()
	attach_normal_leader_lsp()
end

return {
	telekasten = attach_telekasten,
	lsp = attach_lsp,
}
