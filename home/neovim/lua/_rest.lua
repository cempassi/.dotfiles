local ok, rest = pcall(require, "rest-nvim")
if not ok then
	return
end

rest.setup({
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Highlight request on run
  highlight = {
    timeout = 150,
  },
  env_file = ".env",
  custom_dynamic_variables = {},
})
