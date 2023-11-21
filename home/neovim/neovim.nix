{
  config,
  pkgs,
  ...
}: let
  austere-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "austere-nvim";
    version = "18a350626bbc59af0a195e1ec5d39d5bac44f945";
    src = pkgs.fetchFromGitHub {
      owner = "cempassi";
      repo = "austere.nvim";
      rev = version;
      sha256 = "/0wMZY8Gic47LnykaQq2xJO+6n8JYM34V1KtJmQB0+U=";
    };
  };

  incline-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "incline-nvim";
    version = "44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35";
    src = pkgs.fetchFromGitHub {
      owner = "b0o";
      repo = "incline.nvim";
      rev = version;
      sha256 = "oXmZK4cVyuSqmDUwJK0v7YL2g3Kr7zbMgk178D+zzys=";
    };
  };

  possession-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "possession-nvim";
    version = "bc229593043097641c867322c7b9fe44b29e463a";
    src = pkgs.fetchFromGitHub {
      owner = "jedrzejboczar";
      repo = "possession.nvim";
      rev = version;
      sha256 = "6Lztxmy6ykfXhUQ8XLeWpZXh4QVdQ8LbtN6h7Z0v3b8=";
    };
  };

in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      source ~/.config/nvim/_init.vim
    '';

    plugins = with pkgs.vimPlugins; [
      # Start
      dashboard-nvim
      vim-startuptime

      # UI
      nui-nvim
      noice-nvim

      # Telescope
      telescope-github-nvim
      telescope-nvim
      #telescope-terraform-doc-nvim # Custom

      #Session
      possession-nvim

      # LSP
      {
        plugin = nvim-lspconfig;
        config = ''
          lua << EOF
          tsserver_path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib/tsserver.js"
          EOF
        '';
      }
      lspsaga-nvim
      null-ls-nvim
      fidget-nvim
      hover-nvim 

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
      dirbuf-nvim 
      leap-nvim
      neoscroll-nvim


      # Git
      vim-fugitive

      vim-git
      git-messenger-vim
      gitsigns-nvim

      # REST Api calls
      rest-nvim

      # Theme
      nordic-nvim
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
      which-key-nvim

      # Debugger Adapter Protocol
      nvim-dap

      # Lua
      nvim-luapad

      # Rust
      crates-nvim

      #Java
      {
        plugin =nvim-jdtls ;
        config = ''
          lua << EOF
          jdtls_path = "${pkgs.jdt-language-server}"
          lombok_path = "${pkgs.lombok}"
          EOF
        '';
      }

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
      specs-nvim
    ];

    extraPackages = with pkgs; [
      terraform-ls
      stylua
      black
      selene
      shfmt
      isort
      alejandra
      glow
      tree-sitter
      lua-language-server
      jdt-language-server
      taplo
      nodePackages.yaml-language-server
      nodePackages.typescript-language-server
      nodePackages.typescript
      nodePackages.pyright
      nodePackages.prettier
      nodePackages.vim-language-server
      nodePackages.typescript
      nodePackages.bash-language-server
      rnix-lsp
    ];
  };

  xdg.configFile.nvim = {
    source = ../neovim;
    recursive = true;
  };
}
