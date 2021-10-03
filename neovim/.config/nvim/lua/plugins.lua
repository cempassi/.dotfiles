vim.cmd [[packadd packer.nvim]]

local config = {
  git = {
    default_url_format = 'git@github.com:%s' -- Lua format string used for "aaa/bbb" style plugins
  },
}

return require('packer').startup({function()
  use {'wbthomason/packer.nvim', opt = true}

  -- Status bar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Completion
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'

  -- Telescope
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'}}
    }

    -- Debugger
    use 'mfussenegger/nvim-dap'

    -- File Navigation
    --use {'ms-jpq/chadtree', branch = 'chad'}
    use 'justinmk/vim-dirvish'

    -- Git integration
    use 'tpope/vim-fugitive'
    use 'tpope/vim-git'
    use 'airblade/vim-gitgutter'
    use 'rhysd/git-messenger.vim'

    -- Floating terminal
    use 'voldikss/vim-floaterm'

    -- Async tasks
    use 'skywind3000/asynctasks.vim'
    use 'skywind3000/asyncrun.vim'

    -- Startup
    use 'glepnir/dashboard-nvim'
    use 'dstein64/vim-startuptime'

    -- Syntax Higlighting
    use 'cespare/vim-toml'
    use 'rodjek/vim-puppet'

    -- Window scrolling
    use 'karb94/neoscroll.nvim'

    -- Misc
    use 'simrat39/rust-tools.nvim'
    use 'pbondoer/vim-42header'
    use 'liuchengxu/vim-which-key'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'hashivim/vim-terraform'
    use 'tjdevries/astronauta.nvim'
    use 'rust-lang/rust.vim'
    use 'editorconfig/editorconfig-vim'

    -- Lua development
    --use 'bfredl/nvim-luadev'
    --use 'nvim-treesitter/playground'
    --use {'glacambre/firenvim'}

    --local development, only use at home
    --use '~/Programming/nvim/nvim-dap'
    --use '~/Programming/nvim/nvim-dap-virtual-text'
    --use '~/Programming/nvim/plenary.nvim'
    --use '~/Programming/nvim/telescope.nvim'
    --use '~/Programming/nvim/telescope-packer.nvim'
    --use '~/Programming/nvim/telescope-github.nvim'
  end,
  config = config
})
