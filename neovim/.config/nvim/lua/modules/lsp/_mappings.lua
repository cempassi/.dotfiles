local k = require("astronauta.keymap")
local nnoremap = k.nnoremap
local inoremap = k.inoremap

local M = {}

-- local provider = require"lspsaga.provider"
local hover = require("lspsaga.hover")
local codeaction = require("lspsaga.codeaction")
local sig_help = require("lspsaga.signaturehelp")
local rename = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")

M.lsp_mappings = function()
  inoremap{'<leader>cs', sig_help.signature_help, { silent = true }}
  nnoremap{'<leader>cf', vim.lsp.buf.formatting, { silent = true }}
  nnoremap{'<leader>ci', require("lspsaga.provider").preview_definition, { silent = true }}
  nnoremap{'<leader>cd', vim.lsp.buf.definition, { silent = true }}
  nnoremap{'<leader>cf', vim.lsp.buf.formatting, { silent = true }}
  nnoremap{'<leader>ce', diagnostic.show_line_diagnostics, { silent = true }}
end

return M
