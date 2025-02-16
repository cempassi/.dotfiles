-- Insert here dev plugins with vim.opt.runtimepath:prepend()

-- Lsp Configuration
require("modules.lsp")

-- Plugin Config Loading
require("_auto_pairs")
require("_cmdline")
require("_cmp")
require("_comment")
require("_dap")
require("_dashboard")
require("_dirbuf")
require("_gitsigns")
require("_glow")
require("_hover")
require("_incline")
require("_leap")
require("_lspkind")
require("_lspsaga")
require("_lualine")
require("_luasnip")
require("_neoscroll")
require("_noice")
require("_nordic")
require("_null-ls")
require("_rest")
require("_surround")
require("_telekasten")
require("_telescope")
require("_themer")
require("_treesitter")
require("_true_zen")
require("_which-key")

require("crates").setup()
require("fidget").setup({})
require("nordic").colorscheme()

require("colorizer").setup()

vim.filetype.add({
  pattern = {
    ["*.tfvars"] = { "terraform", { priority = 30 } },
  },
})

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("BufEnter", {
  pattern = "*.tfvars",
  command = "set filetype=terraform ",
})

autocmd("BufNewFile", {
  pattern = "*.tfvars",
  command = "set filetype=terraform ",
})
