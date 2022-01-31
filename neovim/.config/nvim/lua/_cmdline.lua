vim.api.nvim_set_keymap(
  'n',
  '<leader>;',
  ':lua require("fine-cmdline").open()<CR>',
  {noremap = true}
)

require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true
  },
  popup = {
    relative = "editor",
    position = {
      row = '50%',
      col = '50%',
    },
    size = {
      width = '50%',
      height = 1
    },
    border = {
      style = 'rounded',
      highlight = 'FloatBorder',
    },
    win_options = {
      winhighlight = 'Normal:Normal',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      -- code
    end
  }
})
