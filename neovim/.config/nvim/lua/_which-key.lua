local register = require("which-key").register

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Change escape to jk in all modes
register({j = { name = "Escape", k = {"<esc>", "Insert" }}}, { mode = "i"})
register({j = { name = "Escape", k = {"<C-c>", "Command" }}}, { mode = "c"})
register({j = { name = "Escape", k = {"<esc>", "Visual" }}}, { mode = "v"})
register({j = { name = "Escape", k = {t("<c-\\><c-N>"), "Terminal" }}}, { mode = "t", noremap = true})

-- Unmap Normal mode keys
register({
  ["<right>"] = {"<nop>", "Unmap right"},
  ["<left>"]  = {"<nop>", "Unmap left"},
  ["<up>"]    = {"<nop>", "Unmap up"},
  ["<down>"]  = {"<nop>", "Unmap down"},
  ["Q"]  = {"<nop>", "Unmap Q"},
})

-- Unmap Insert mode keys
register({
  ["<right>"] = {"<nop>", "Unmap right"},
  ["<left>"]  = {"<nop>", "Unmap left"},
  ["<up>"]    = {"<nop>", "Unmap up"},
  ["<down>"]  = {"<nop>", "Unmap down"},
}, {mode = "i"})

-- Buffer Mappings
register({
  ["<tab>"] = {":bn<cr>", "Buffer next"},
  ["<S-tab>"] = {":bp<cr>", "Buffer previous"},
  ["<leader>bd"] = {":bp|bdelete! #<cr>", "Buffer delete"},
})

-- Go to Previous
register({
  ["["] = {
    name = "Previous",
    p = {"<C-^>", "Buffer"},
    q = {":cprevious<cr>", "Quickfix list"},
    g = {"<Plug>(GitGutterPrevHunk)", "Git Hunk"},
    t = {":FloatermPrev<CR>", "Terminal"},
    e = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lsp Error"},
  }
})

-- Previous Terminal
register({
  ["["] = {
    name = "Previous",
    t = { t("<c-\\><c-N>:FloatermPrev<CR>"),	"Terminal" },
  },
}, { mode = 't', noremap = true, silent = true })

-- Go to Next
register({
  ["]"] = {
    name = "Next",
    q = {":cnext<cr>", "Quickfix list"},
    g = {"<Plug>(GitGutterNextHunk)", "Git Hunk"},
    t = {":FloatermNext<CR>", "Terminal"},
    e = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Lsp Error"}
  }
})

-- Next Terminal
register({
  ["]"] = {
    name = "Previous",
    t = { t("<c-\\><c-N>:FloatermNext<CR>"),	"Terminal" },
  },
}, { mode = 't', noremap = true, silent = true })

--Git
register({
  g = {
    name = "Git",
    A = {":Git add %<cr>", "Add File"},
    s = {"<Plug>(GitGutterStageHunk)", "Stage Hunk"},
    ["<Enter>"] = {":Git commit <cr>", "Create commit"},
    ["<BS>"] = {":Git commit --amend --no-edit<cr>", "Amend commit"},
    U = {":Git restore %<cr>", "Undo changes (restore file)"},
    h = {":GitGutterLineHighlightsToggle<cr>", "Undo changes (restore file)"},
    H = {":Gcd<cd>", "Change directore to git root of current file"},
    ["["] = {"<cmd>FloatermNew --disposable git pull<cr>", "Pull"},
    ["]"] = {"<cmd>FloatermNew --disposable git push<cr>", "Push"},
    ["l<leader>"] = {"<cmd>FloatermNew --disposable git ls<cr>", "List 10 last commits"},
    r = {":GRename %", "Rename file"}
  },
  G = {
    name = "Git",
    ["<Enter>"] = {":Git commit --all<cr>", "Create commit with all files"},
    ["["] = {"<cmd>FloatermNew --disposable git pull -f<cr>", "Pull force"},
    ["]"] = {"<cmd>FloatermNew --disposable git push -f<cr>", "Push force"},
    
  }
}, {prefix = "<leader>"}) 
