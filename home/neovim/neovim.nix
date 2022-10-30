{
  config,
  pkgs,
  ...
}: let
  austere-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix rec {
    pname = "austere-nvim";
    version = "18a350626bbc59af0a195e1ec5d39d5bac44f945";
    src = pkgs.fetchFromGitHub {
      owner = "cempassi";
      repo = "austere.nvim";
      rev = version;
      sha256 = "/0wMZY8Gic47LnykaQq2xJO+6n8JYM34V1KtJmQB0+U=";
    };
  };

  dirbuf-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix rec {
    pname = "dirbuf-nvim";
    version = "ac7ad3c8e61630d15af1f6266441984f54f54fd2";
    src = pkgs.fetchFromGitHub {
      owner = "elihunter173";
      repo = "dirbuf.nvim";
      rev = version;
      sha256 = "35pNyVO0Yx+g5nvcFOmi2npb9Bnv83mkOtQJ2eKbSyc=";
    };
  };

  incline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix rec {
    pname = "incline-nvim";
    version = "44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35";
    src = pkgs.fetchFromGitHub {
      owner = "b0o";
      repo = "incline.nvim";
      rev = version;
      sha256 = "oXmZK4cVyuSqmDUwJK0v7YL2g3Kr7zbMgk178D+zzys=";
    };
  };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Start
      impatient-nvim
      dashboard-nvim
      vim-startuptime

      # Telescope
      telescope-github-nvim
      telescope-nvim
      #telescope-terraform-doc-nvim # Custom

      # LSP
      nvim-lspconfig
      null-ls-nvim
      fidget-nvim
      #hover-nvim # Custom

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      cmp-treesitter
      cmp-spell
      lspkind-nvim
      friendly-snippets
      luasnip

      # File Navigation
      dirbuf-nvim # Custom
      leap-nvim
      neoscroll-nvim

      # Session
      #persisted-nvim #Custom

      # Notes
      #telekasten-nvim # Custom

      # Git
      vim-fugitive
      vim-git
      git-messenger-vim
      gitsigns-nvim

      # Floating cmdline
      #fine-cmdline-nvim

      # REST Api calls
      rest-nvim

      # Theme
      austere-nvim # Custom

      # Edition
      nvim-comment
      nvim-autopairs
      nvim-surround
      vim-repeat

      # Treesitter
      nvim-treesitter
      playground

      # Statusline
      lualine-nvim
      incline-nvim # Custom

      # Terminal
      vim-floaterm

      # Tasks
      asynctasks-vim
      asyncrun-vim

      # Mappings
      vim-which-key

      # Debugger Adapter Protocol
      nvim-dap

      # Lua
      nvim-luapad

      # Rust
      crates-nvim

      # Markdown
      # glow-nvim # Custom
      # follow-md-links-nvim # Custom

      # Language Syntax
      vim-nix
      vim-toml

      # Utils
      plenary-nvim
      nvim-web-devicons
      nvim-notify
      popup-nvim
      nvim-colorizer-lua
      #vim-42header # Custom
    ];

    extraPackages = with pkgs; [
      pkgs.terraform-ls
      pkgs.stylua
      pkgs.black
      pkgs.selene
      pkgs.shfmt
      pkgs.alejandra
      pkgs.glow
      pkgs.rust-analyzer
      pkgs.sumneko-lua-language-server
      pkgs.nodePackages.yaml-language-server
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.typescript
      pkgs.nodePackages.pyright
      pkgs.nodePackages.prettier
      pkgs.rnix-lsp
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}