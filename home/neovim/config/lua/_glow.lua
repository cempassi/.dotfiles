local ok, glow = pcall(require, "glow")
if not ok then
    return
end

glow.setup({
  style = "dark",
  width = 250,
  height = 250,
  border = "rounded"
})
