local api = vim.api

-- Highlight on Yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	command = 'silent! lua vim.highlight.on_yank({"Substract", 200})',
	group = yankGrp,
})

local mapTelekasten = api.nvim_create_augroup("MapTelekesten", {clear = true})

api.nvim_create_autocmd({"Filetype"}, {
  pattern = "markdown",
  callback = require("_which-key").telekasten,
  group = mapTelekasten
})
