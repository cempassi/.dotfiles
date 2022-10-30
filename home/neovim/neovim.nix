{ config
, pkgs
, ...
}:

let
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

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      ## Custom Installed ##

      # Theme
      austere-nvim

      # Directory Navigation
      dirbuf-nvim

      # Status-line
      incline-nvim

      #persisted-nvim
      #telekasten-nvim
      #fine-cmdline-nvim
      #hover-nvim
      #telescope-terraform-doc-nvim
      #themer-lua
      #glow-nvim
      #follow-md-links-nvim
      #vim-42header
      impatient-nvim
      lualine-nvim
      nvim-web-devicons
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      cmp-treesitter
      cmp-spell
      lspkind-nvim
      luasnip
      friendly-snippets
      dashboard-nvim
      nvim-luapad
      FixCursorHold-nvim
      nvim-comment
      vim-nix
      nvim-autopairs
      nvim-surround
      nui-nvim
      nvim-treesitter
      leap-nvim
      vim-repeat
      nvim-lspconfig
      null-ls-nvim
      fidget-nvim
      nvim-notify
      telescope-nvim
      plenary-nvim
      popup-nvim
      telescope-github-nvim
      nvim-dap
      vim-fugitive
      vim-git
      git-messenger-vim
      gitsigns-nvim
      vim-floaterm
      asynctasks-vim
      asyncrun-vim
      vim-startuptime
      lush-nvim
      which-key-nvim
      true-zen-nvim
      vim-toml
      neoscroll-nvim
      crates-nvim
      plenary-nvim
      rest-nvim
      project-nvim
      vim-which-key
      nvim-web-devicons
      nvim-colorizer-lua
      editorconfig-vim
      playground
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
