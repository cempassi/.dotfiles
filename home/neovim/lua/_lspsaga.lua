local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
    return
end

lspsaga.setup({
diagnostic = {
    show_code_action = false,
  };
 symbol_in_winbar = {
    enable = false,
  },
})
