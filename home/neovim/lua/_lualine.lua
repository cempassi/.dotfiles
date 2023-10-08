local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end
local function session_name()
    return require('possession.session').session_name or ''
end

lualine.setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = false,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { session_name, "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } },  {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      } },
		lualine_c = {
			{ "%=", separator = " ", padding = 5 },
			{ "filename", file_status = true, padding = { left = 10, right = 10 } },
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
