vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function()
		use("~/Programming/perso/austere.nvim")
	end,
})
