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
		builtins.formatting.shfmt, --shell
		builtins.formatting.terraform_fmt.with({
      filetypes = {"terraform", "terraform-vars" }

    }), --terraform
    builtins.diagnostics.ruff, --python
		builtins.formatting.ruff, --python
	},
})
