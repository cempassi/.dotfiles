vim.lsp.config('rust_analyzer', {
   settings = {
    ['rust-analyzer'] = {
			assist = {
				importMergeBehaviour = "full",
			},

			callInfo = {
				full = true,
		},

			cargo = {
				loadOutDirsFromCheck = true,
			},

			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},

			procMacro = {
				enable = true,
			},
     }
   }
 })
