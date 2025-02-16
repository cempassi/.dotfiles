local ok, leap = pcall(require, "leap")
if not ok then
    return
end

leap.set_default_keymaps()
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "Label" })
vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = 'grey' })
