{
  pkgs,
  lib,
  ...
}: let
  fromGitHub = rev: ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "git@github.com:${repo}.git";
        ref = ref;
        rev = rev;
      };
    };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    initLua =  builtins.readFile ./_init.lua ;
    withPython3 = true;
    withRuby = false;

    plugins = with pkgs.vimPlugins; [
      # Start
      dashboard-nvim
      vim-startuptime

      # UI
      nui-nvim
      noice-nvim
      incline-nvim
      mini-nvim

      # Telescope
      telescope-github-nvim
      telescope-nvim
      #telescope-terraform-doc-nvim # Custom

      # LSP
      {
        plugin = nvim-lspconfig;
        config = ''
          tsserver_path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js"
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
      # cmp-spell
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

      #vim-git
      git-messenger-vim
      gitsigns-nvim

      # REST Api calls
      #rest-nvim

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
      #playground

      # Statusline
      lualine-nvim

      # Terminal
      toggleterm-nvim

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
        plugin = nvim-jdtls;
        config = ''
          jdtls_path = "${pkgs.jdt-language-server}"
          lombok_path = "${pkgs.lombok}"
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
      #specs-nvim
    ];

    extraPackages = with pkgs; [
      terraform-ls
      nil
      stylua
      ruff
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
      yaml-language-server
      typescript-language-server
      typescript
      prettier
      vim-language-server
      typescript
      bash-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ../neovim;
    recursive = true;
  };
}
