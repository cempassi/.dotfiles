vim.cmd [[packadd packer.nvim]]

local config = {
  git = {
    default_url_format = 'git@github.com:%s' -- Lua format string used for "aaa/bbb" style plugins
  },
}

return require('packer').startup({function()
  use {'wbthomason/packer.nvim', opt = true}

  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'ray-x/cmp-treesitter'},
      {'f3fora/cmp-spell'}
    }
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = {
      {'rafamadriz/friendly-snippets'}
    }
  }

  use 'onsails/lspkind-nvim'

  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Code Navigation
  use 'ggandor/leap.nvim'
  use 'tpope/vim-repeat'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use { 
    'tami5/lspsaga.nvim',
  } 

  -- Notification
  use 'rcarriga/nvim-notify'

  -- Telescope
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'}
    }
  }

  use 'nvim-telescope/telescope-github.nvim'

  -- Debugger
  use 'mfussenegger/nvim-dap'

  -- File Navigation
  use "elihunter173/dirbuf.nvim"

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

  -- Theme
  use 'cempassi/monochrome.nvim'
  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    requires = "rktjmp/lush.nvim"
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  }

  use({
    "themercorp/themer.lua",
    config = function()
      require("themer").setup({
        colorscheme = "nord",
        styles = {
          ["function"] = { style = 'italic' },
          functionbuiltin = { style = 'italic' },
          variable = { style = 'italic' },
          variableBuiltIn = { style = 'italic' },
          parameter  = { style = 'italic' },
        },
      })
    end
  })

  -- Key Mappings
  use "folke/which-key.nvim"

  -- Zen mode
  use "Pocco81/TrueZen.nvim"

  -- Syntax Higlighting
  use 'cespare/vim-toml'

  -- Window scrolling
  use 'karb94/neoscroll.nvim'

  -- Rust
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- Rest api
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  }

  -- Poject Management
  use 'ahmedkhalf/project.nvim'

  -- Misc
  use 'pbondoer/vim-42header'
  use 'liuchengxu/vim-which-key'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'hashivim/vim-terraform'
  use 'editorconfig/editorconfig-vim'

  -- Lua development
  --use 'bfredl/nvim-luadev'
  use 'nvim-treesitter/playground'
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
