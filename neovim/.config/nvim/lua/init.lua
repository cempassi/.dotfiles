require('_telescope')
require('_lualine')
require('_treesitter')
require('_neuron')
require('_cmp')
--require('_rust_tools')
require('modules.lsp')
require('_neoscroll')
require('_dap')
require('_true_zen')
require('_cmdline')
require('_themer')
--require('_project')
require('leap').set_default_keymaps()
require('_which-key')
require('_auto_pairs')
require('_dashboard')

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    mode = "symbol_text",

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
