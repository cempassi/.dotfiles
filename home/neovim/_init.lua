--                                %@@@@@@@@@@@@@@@@@/
--                         %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,
--                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--                 .@@@@@@@@  ,@@@@@@,           &@@@@@@   @@@@@@@@
--               @@@@@@@     @@@@@#                 @@@@@@     @@@@@@@
--             @@@@@@       @@@@@     @@@@@@@   .     @@@@@       @@@@@@
--           @@@@@@        &@@@@     @@@@@@@&    @     @@@@,        @@@@@@
--         &@@@@@          @@@@@    %@@@@@@@@@@@@@,    @@@@&          @@@@@*
--           @@@@@@        &@@@@     @@@@@@@@@@@@@     @@@@         @@@@@@
--             @@@@@@       @@@@@      @@@@@@@@@      @@@@@      ,@@@@@@
--               @@@@@@@     @@@@@@                 @@@@@@    *@@@@@@@
--                  @@@@@@@@   @@@@@@@           @@@@@@@  ,@@@@@@@@
--                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(
--                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--                                 @@@@@@@@@@@@@@@@%

local cmd = vim.cmd
local fn = vim.fn

_G.load_config = function()
	require("config.options")

	--require("mange.theme").setup()
	--require("mange.mappings").setup()

	--require("mange.cursorline").setup()
	--require("mange.yank_highlight").setup()
	--require("mange.vimdiff").setup()

	--require("mange.autocommands")
end

--
-- Startup (and bootstapping)
--
-- Bootstrap Packer if not installed already
-- 
do
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.isdirectory(install_path) == 0 then
		fn.system({
			"git",
			"clone",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		cmd("packadd packer.nvim")
		require("plugins")
		require("packer").sync()
		cmd("autocmd User PackerComplete ++once lua load_config()")
	else
		require("plugins")
		load_config()
	end
end
