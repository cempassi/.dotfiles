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
require("_incline")
require("_lspkind")
require("_lualine")
require("_luasnip")
require("_neoscroll")
require("_neuron")
require("_null-ls")
require("_persisted")
require("_surround")
require("_telekasten")
require("_telescope")
require("_themer")
require("_treesitter")
require("_true_zen")
require("_which-key")

require("leap").set_default_keymaps()
require("fidget").setup({})

vim.filetype.add({
	pattern = {
		["*.tfvars"] = { "terraform", { priority = 30 } },
	},
})
