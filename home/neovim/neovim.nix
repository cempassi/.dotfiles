{
  pkgs,
  lib,
  ...
}: let  

fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "git@github.com:${repo}.git";
      ref = ref;
      rev = rev;
    };
  };

#  possession-nvim = pkgs.vimUtils.buildVimPlugin rec {
#    pname = "possession-nvim";
#    version = "bc229593043097641c867322c7b9fe44b29e463a";
#    src = pkgs.fetchFromGitHub {
#      owner = "jedrzejboczar";
#      repo = "possession.nvim";
#      rev = version;
#      sha256 = "6Lztxmy6ykfXhUQ8XLeWpZXh4QVdQ8LbtN6h7Z0v3b8=";
#    };
#  };

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
      (fromGitHub "16fc9c073e3ea4175b66ad94375df6d73fc114c0" "main" "b0o/incline.nvim")
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
      #possession-nvim

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
      none-ls-nvim
      fidget-nvim
      hover-nvim 

      # Null ls replacement
      none-ls-nvim

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      cmp-treesitter
      cmp-spell
      cmp-git
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
      #austere-nvim # Custom

      # Edition
      nvim-comment
      nvim-autopairs
      nvim-surround
      vim-repeat

      # Treesitter
      nvim-treesitter.withAllGrammars
      playground

      # Statusline
      lualine-nvim

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
      nil
      stylua
      ruff
      ruff-lsp
      selene
      shfmt
      alejandra
      glow
      tree-sitter
      lua-language-server
      jdt-language-server
      shellcheck
      taplo
      pyright
      nodePackages.yaml-language-server
      nodePackages.typescript-language-server
      nodePackages.typescript
      nodePackages.prettier
      nodePackages.vim-language-server
      nodePackages.typescript
      nodePackages.bash-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ../neovim;
    recursive = true;
  };
}
