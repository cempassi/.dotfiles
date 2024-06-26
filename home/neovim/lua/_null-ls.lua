local ok, null = pcall(require, "null-ls")
if not ok then
	return
end

local builtins = null.builtins
null.setup({
	require("_which-key").lsp(),
	sources = {
		builtins.formatting.stylua, -- lua
		builtins.formatting.alejandra, -- Nix
		builtins.formatting.prettier.with({
			filetypes = { "html", "json", "yaml", "markdown", "telekasten", "js", "ts" },
		}), --  JS/TS, JSON,
		builtins.formatting.shfmt.with({
			filetypes = { "zsh", "sh" },
		}), --shell
		builtins.formatting.terraform_fmt.with({
			filetypes = { "terraform", "terraform-vars" },
		}), --terraform
	},
})
