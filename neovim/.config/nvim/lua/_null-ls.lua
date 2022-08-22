local builtins = require("null-ls").builtins
require("null-ls").setup({
	sources = {
		builtins.formatting.stylua, -- lua
		builtins.formatting.alejandra, -- Nix
    builtins.formatting.prettier, --  JS/TS, JSON,
		builtins.formatting.shfmt, --shell
		builtins.formatting.terraform_fmt, --terraform
		builtins.formatting.black.with({ extra_args = { "--fast" } }), --python
		builtins.formatting.isort, --python
	},
})
