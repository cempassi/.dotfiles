require('_telescope')
require('_treesitter')
require('_neuron')
require('_compe')
require('_rust_tools')
require('modules.lsp')

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "ƒ",
      Function = "ﬦ",
      Constructor = "",
      Variable = "",
      Class = "",
      Interface = "ﰮ",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "了",
      Keyword = "",
      Snippet = "﬌",
      Color = "",
      File = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
    },
})

-- CHADTree settings
-- api.nvim_set_var("chadtree_settings",{
-- 		open_left = true,
-- 		keymap = {
-- 			quit = "_",
-- 			smaller = "(",
-- 			bigger = ")",
-- 			change_focus = ">",
-- 			change_focus_up = "<",
-- 			refocus = "="
-- 		}
-- 	}
-- )


