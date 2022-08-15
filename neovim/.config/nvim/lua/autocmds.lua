local api = vim.api

-- Highlight on Yank
local yank_Grp = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	command = 'silent! lua vim.highlight.on_yank({"Substract", 200})',
	group = yank_Grp,
})

local map_telekasten = api.nvim_create_augroup("MapTelekesten", {clear = true})

api.nvim_create_autocmd({"Filetype"}, {
  pattern = "markdown",
  callback = require("_which-key").telekasten,
  group = map_telekasten
})
