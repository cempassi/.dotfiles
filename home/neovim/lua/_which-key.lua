local ok, key = pcall(require, "which-key")
if not ok then
	return
end

-- -- -- -- -- Settings -- -- -- -- --

key.setup({
	opts = {
		win = {
			padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "center",
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	},
	layout = {
		spacing = 4, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
})

-- Change escape to jk in all modes
key.add({
	{ "jk", "<esc>", desc = "Normal from insert", mode = "i" },
	{ "jk", "<C-c>", desc = "Normal from command", mode = "c" },
	{ "jk", "<esc>", desc = "Normal from visual", mode = "v" },
	{ "jk", "<C-\\><C-n>", desc = "Normal from visual", mode = "t" },
})

key.add({
	{ ";", ":", desc = "Semicolon as colon" },
	{ ";", ":", desc = "Semicolon as colon", mode = "v" },
	{ ",", ";", desc = "Next find or til'" },
	{ ",", ";", desc = "Next find or til'", mode = "v" },
})

-- Digraph mappings
key.add({
	mode = { "i" },
	{ ",", group = "Special characters (Digraph)" },
	{ ",.", "<C-K>", desc = "Enter Digraph" },
	{ ",?", "<esc>:digraph<cr>", desc = "List Digraphs" },
})

-- Unmap Normal mode keys
key.add({
	{ "<down>", "<nop>", desc = "Unmap down" },
	{ "<left>", "<nop>", desc = "Unmap left" },
	{ "<right>", "<nop>", desc = "Unmap right" },
	{ "<up>", "<nop>", desc = "Unmap up" },
	{ "Q", "<nop>", desc = "Unmap Q" },
})

-- Unmap Insert mode keys
key.add({
	mode = { "i" },
	{ "<down>", "<nop>", desc = "Unmap down" },
	{ "<left>", "<nop>", desc = "Unmap left" },
	{ "<right>", "<nop>", desc = "Unmap right" },
	{ "<up>", "<nop>", desc = "Unmap up" },
})

-- Buffer Mappings
key.add({
	{ "<S-tab>", ":bp<cr>", desc = "Buffer previous" },
	{ "<leader>bd", ":bp|bdelete! #<cr>", desc = "Buffer delete" },
	{ "<leader>nh", ":noh<CR>", desc = "No Highlights" },
	{ "<tab>", ":bn<cr>", desc = "Buffer next" },
})

-- Window Movements
key.add({
	{ "<leader>h", ":wincmd h<CR>", desc = "Move left window" },
	{ "<leader>j", ":wincmd j<CR>", desc = "Move down window" },
	{ "<leader>k", ":wincmd k<CR>", desc = "Move up window" },
	{ "<leader>l", ":wincmd l<CR>", desc = "Move right window" },
})

-- Window Maniplation
key.add({
	{ "<leader>0", "<C-w>o", desc = "Focus on current window" },
	{ "<leader><", "<C-w>R", desc = "Rotate left" },
	{ "<leader><BS>", "<C-w><C-x>", desc = "Swap windows" },
	{ "<leader>=", "<C-w>=", desc = "Balance windows" },
	{ "<leader>>", "<C-w>r", desc = "Rotate right" },
	{ "<leader>H", "<C-w>K", desc = "Shift to Horizontal" },
	{ "<leader>V", "<C-w>H", desc = "Shift to Vertical" },
	{ "<leader>_", ":split<cr>", desc = "Split Horizontaly" },
	{ "<leader>|", ":vsplit<cr>", desc = "Split Verticaly" },
})

-- Save and quit
key.add({
	{ "<leader>Q", ":qa!<cr>", desc = "Close (All)" },
	{ "<leader>W", ":wa<cr>", desc = "Save (All)" },
	{ "<leader>X", ":xa<cr>", desc = "Save and close (All)" },
	{ "<leader>q", ":q<cr>", desc = "Close (Buffer)" },
	{ "<leader>w", ":w<cr>", desc = "Save (Buffer)" },
	{ "<leader>x", ":x<cr>", desc = "Save and close (Buffer)" },
})

key.add({
	{ "I", "<cmd>TSHighlightCapturesUnderCursor<CR>", desc = "Show Highlight" },
})

-- Dashboard (Start plugin)
key.add({
	{ "<leader>e.", ":DashboardNewFile<CR>", desc = "Open new buffer" },
	{ "<leader>f<leader>", ":DashboardFindFile<CR>", desc = "Find file" },
	{ "<leader>fb", ":DashboardJumpMark<CR>", desc = "List jump marks" },
	{ "<leader>fc", ":DashboardChangeColorscheme<CR>", desc = "Change Colorscheme" },
	{ "<leader>fh", ":DashboardFindHistory<CR>", desc = "Find history" },
})

-- Persisted (Session manager)
key.add({
	{ "<leader>sl", "<cmd>PossessionLoad<cr>", desc = "Load session" },
	{ "<leader>ss", "<cmd>PossessionSave<cr>", desc = "Save session" },
})

-- Go to Previous
key.add({
	{ "[", group = "Previous" },
	{ "[c", "g;", desc = "Change list" },
	{ "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Next Diagnostic" },
	{ "[g", ":Gitsigns prev_hunk<cr>", desc = "Git Hunk" },
	{ "[j", "<c-o>", desc = "Jumplist" },
	{ "[p", "<C-^>", desc = "Buffer" },
	{ "[q", ":cprevious<cr>", desc = "Quickfix list" },
	{ "[t", ":FloatermPrev<CR>", desc = "Terminal" },
})

-- Go to Next
key.add({
	{ "]", group = "Next" },
	{ "]c", "g,", desc = "Change list" },
	{ "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
	{ "]g", ":Gitsigns next_hunk<cr>", desc = "Git Hunk" },
	{ "]j", "<c-i>", desc = "Jump list" },
	{ "]q", ":cnext<cr>", desc = "Quickfix list" },
	{ "]t", ":FloatermNext<CR>", desc = "Terminal" },
})

-- Telescope
key.add({
	{
		"<leader>.",
		"<cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git cwd=~/.dotfiles<CR>",
		desc = "List Dotfiles",
	},
	{
		"<leader>/",
		"<cmd>Telescope live_grep<CR>",
		desc = "List Word",
	},
	{
		"<leader>?",
		"<cmd>Telescope help_tags<CR>",
		desc = "List Help",
	},
	{
		"<leader>E<leader>",
		"<cmd>Telescope diagnostics<CR>",
		desc = "All Diagnostics",
	},
	{
		"<leader>F<leader>",
		"<cmd>Telescope oldfiles<CR>",
		desc = "List Old files",
	},
	{
		"<leader>[<leader>",
		"<cmd>Telescope quickfix<cr>",
		desc = "Show Quickfix",
	},
	{
		"<leader>]<leader>",
		"<cmd>Telescope loclist<cr>",
		desc = "Show Loclist",
	},
	{
		"<leader>b<leader>",
		"<cmd>Telescope buffers<cr>",
		desc = "Show Loclist",
	},
	{
		"<leader>e<leader>",
		"<cmd>Telescope diagnostics bufnr=0<CR>",
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>f<leader>",
		"<cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>",
		desc = "List Files",
	},
	{
		"<leader>g<leader>",
		"<cmd>Telescope git_status<CR>",
		desc = "Git Status",
	},
	{
		"<leader>h<leader>",
		"<cmd>Telescope highlights<CR>",
		desc = "List Sessions",
	},
	{
		"<leader>n<leader>",
		" <cmd>Telescope notify<CR>",
		desc = "List notifications",
	},
	{
		"<leader>s<leader>",
		"<cmd>Telescope possession list<CR>",
		desc = "List Sessions",
	},
})

-- Debugger -- TODO
--register({
--	name = "Debugger",
--	s = { require("dap").step_over, "Step Over" },
--	i = { require("dap").step_into, "Step Into" },
--	o = { require("dap").step_out, "Step Out" },
--	c = { require("dap").continue, "Continue" },
--	b = { require("dap").toggle_breakpoint, "Toogle Breakpoint" },
--	l = { require("dap").set_breakpoint, "Set Log point" },
--	r = { require("dap").repl.open, "Open repl" },
--}, { prefix = "<leader>d" })

-- Tasks
key.add({
	{ "<leader>m", group = "Tasks" },
	{ "<leader>mE", ":AsyncTask -E<cr>", desc = "Edit global tasks" },
	{ "<leader>mK", ":AsyncTask debug<cr>", desc = "Build in debug" },
	{ "<leader>mR", ":AsyncTask run-debug<cr>", desc = "Run in debug" },
	{ "<leader>mc", ":AsyncTask clean<cr>", desc = "Clean" },
	{ "<leader>me", ":AsyncTask -e<cr>", desc = "Edit local tasks" },
	{ "<leader>mk", ":AsyncTask build<cr>", desc = "Build" },
	{ "<leader>ml", ":AsyncTask lint<cr>", desc = "Check Errors (Lint)" },
	{ "<leader>mr", ":AsyncTask run<cr>", desc = "Run" },
	{ "<leader>mt", ":AsyncTask test<cr>", desc = "Test" },
})

-- Floaterm
key.add({
	{ "<leader><leader>", ":FloatermToggle<CR>", desc = "Toggle Terminal" },
	{ "<leader><leader>", ":FloatermToggle<CR>", desc = "Toggle Terminal", mode = "c" },
	{ "<leader>tc", ":FloatermNew<CR>", desc = "Create new Terminal" },
})

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
key.add({
	{ "<leader>B", group = "Git" },
	{ "<leader>B<leader>", "<cmd>Telescope git_branches<CR>", desc = "List branches" },
	{ "<leader>G", group = "Git" },
	{
		"<leader>G<BS>",
		":Git commit --all --amend --no-edit<cr>",
		desc = "Add all modified files to previous commit",
	},
	{ "<leader>G<Enter>", ":Git commit --all<cr>", desc = "Create commit with all files" },
	{ "<leader>G<leader>", "<cmd>FloatermNew --disposable git status<cr>", desc = "Status" },
	{ "<leader>G[", "<cmd>FloatermNew --disposable git pull -f<cr>", desc = "Pull force" },
	{ "<leader>G]", "<cmd>FloatermNew --disposable git push -f<cr>", desc = "Push force" },
	{ "<leader>g", group = "Git" },
	{ "<leader>g<BS>", ":Git commit --amend --no-edit<cr>", desc = "Amend commit" },
	{ "<leader>g<Enter>", ":Git commit <cr>", desc = "Create commit" },
	{ "<leader>g?", ":Gitsigns preview_hunk<cr>", desc = "Hunk preview" },
	{ "<leader>gA", ":Git add --all<cr>", desc = "Stage all files" },
	{ "<leader>gH", ":Gcd<cd>", desc = "cd to git root" },
	{ "<leader>gU", ":Git restore %<cr>", desc = "Undo changes (restore file)" },
	{ "<leader>g[", "<cmd>FloatermNew --disposable git pull<cr>", desc = "Pull" },
	{ "<leader>g]", "<cmd>FloatermNew --disposable git push<cr>", desc = "Push" },
	{ "<leader>ga", ":Git add %<cr>", desc = "Stage File" },
	{ "<leader>gg", "<cmd>Git<cr>", desc = "Git status --short" },
	{ "<leader>gh", ":Gitsigns toggle_linehl<cr>", desc = "Toggle git lines highlight" },
	{ "<leader>gi", ":Gitsigns toggle_signs<cr>", desc = "Hunk Toogle" },
	{ "<leader>gk", " <Plug>(git-messenger)", desc = "Hunk Info" },
	{ "<leader>gl<leader>", "<cmd>FloatermNew --disposable git ls<cr>", desc = "List 10 last commits" },
	{ "<leader>gn", ":Gitsigns toggle_numhl<cr>", desc = "Hunk Toogle" },
	{ "<leader>gr", ":GRename %", desc = "Rename file" },
	{ "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
	{ "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", desc = "Undo Hunk" },
	{ "<leader>v", group = "Git" },
	{ "<leader>v<leader>", "<cmd>Telescope git_commits<CR>", desc = "List buffer commits (version)" },
})

key.add({})
key.add({
	{ "<c-[>", "<cmd>lua require'luasnip'.jump(-1)<CR>", desc = "Prev Snippet Comp", mode = "i" },
	{ "<c-]>", "<cmd>lua require'luasnip'.jump(1)<CR>", desc = "Next Snippet Comp", mode = "i" },
	{ "<c-[>", "<cmd>lua require'luasnip'.jump(-1)<CR>", desc = "Prev Snippet Comp", mode = "s" },
	{ "<c-]>", "<cmd>lua require'luasnip'.jump(1)<CR>", desc = "Next Snippet Comp", mode = "s" },
})

-- Diagnostic
key.add({
	{ "<leader>eb", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer Diagnostic" },
	{ "<leader>ec", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Cursor Diagnostic" },
	{ "<leader>el", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostic" },
	{ "<leader>ew", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Workspace Diagnostic" },
})

local function scroll_down()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end

local function scroll_up()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end

-- LSP
local function attach_normal_leader_lsp()
	key.add({
		{ "<leader>cD", vim.lsp.buf.definition, buffer = 0, desc = "Go to Declaration" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<cr>", buffer = 0, desc = "Code Action" },
		{ "<leader>cd", vim.lsp.buf.definition, buffer = 0, desc = "Go to Definition" },
		{ "<leader>cf", vim.lsp.buf.format, buffer = 0, desc = "Format Code" },
		{ "<leader>ci", vim.lsp.buf.type_definition, buffer = 0, desc = "Preview definition" },
		{ "<leader>cn", vim.lsp.buf.rename, buffer = 0, desc = "Rename Reference" },
		{ "<leader>cr", "<cmd>Telescope lsp_references<cr>", buffer = 0, desc = "Lsp References" },
		{ "<leader>cs", vim.lsp.buf.signature_help, buffer = 0, desc = "Signature Help" },
		{ "<leader>cv", "<cmd>Lspsaga peek_definition<cr>", buffer = 0, desc = "Peek definition" },
		{ "<down>", scroll_down, desc = "Scroll down", mode = "i" },
		{ "<up>", scroll_up, desc = "Scroll down", mode = "i" },
	})
end

local function attach_lsp()
	attach_normal_leader_lsp()
end

return {
	lsp = attach_lsp,
}
