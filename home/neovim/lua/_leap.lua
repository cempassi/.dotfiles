local ok, leap = pcall(require, "leap")
if not ok then
    return
end

require("leap").set_default_keymaps()
vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = 'grey' })
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "Underlined" })
