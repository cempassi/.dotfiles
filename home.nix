{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "cempassi";
    homeDirectory = "/Users/cedric.mpassi";

    sessionPath = [
      "$HOME/.luarocks/bin" # Lua
      "$PYENV_ROOT/bin" #Pyenv
      "$HOME/.cargo/bin" # Rust
      "/nix/var/nix/profiles/default/bin" # Nix Default
      "$HOME/.nix-profile/bin" #Nix profile
      "$HOME/.tfenv/bin" # Terraform
    ];

    sessionVariables = {
      EDITOR = "nvim";
      PYENV_ROOT = "${config.home.homeDirectory}/.pyenv";
      LSCOLORS = "exfxcxdxbxegedabagacad";
      SSH_KEY_PATH = "~/.ssh/rsa_id";
      BAT_THEME = "Nord";
      KEYTIMEOUT = 1;
      PAGER = "bat --paging=auto --plain";
      MAIL = "cempassi@student.42.fr";
      NODE_EXTRA_CA_CERTS = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  programs.zsh = {
    enable = true;

    defaultKeymap = "viins";
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.dotfiles/zsh";
      plugins = [
        "vi-mode"
        "rust"
        "docker"
        "git"
      ];
      theme = "personal";
    };

    shellAliases = {
      ls = "exa --icons ";
      ll = "exa -1 --icons ";
      lt = "exa -T --icons ";
      le = "exa -lah --icons --ignore-glob='.git' ";
      cd = "z";
      status = "git status";
      szsh = "source ~/.zshrc";
      evim = "vim ~/.config/nvim/init.vim";
      enix = "vim ~/.config/nixpkgs/home.nix";
      cat = "bat";
      switch = "home-manager switch";
      dvim = "nvim --cmd \"set rtp+=$PWD\"";
      space = "dust ~";
      vim = "nvim ";
    };

    localVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=230";
    };

    initExtra = ''
      # Init pyenv
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

   nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = [
    # Text Editor
    pkgs.neovim-nightly
    pkgs.terraform-ls
    pkgs.stylua
    pkgs.black
    pkgs.selene
    pkgs.shfmt
    pkgs.nodePackages.yaml-language-server
    pkgs.nodePackages.pyright

    # Rust Cli tools
    pkgs.ripgrep
    pkgs.tokei
    pkgs.delta
    pkgs.bat
    pkgs.exa
    pkgs.zoxide
    pkgs.fd
    pkgs.bottom
    pkgs.diskonaut
    pkgs.du-dust
    pkgs.rust-analyzer

    # Code managers
    pkgs.gh
    pkgs.glab

    # Container
    pkgs.docker

    # Utils
    pkgs.bash
    pkgs.stow
    pkgs.bitwarden-cli
    pkgs.tmux
    pkgs.jq
    pkgs.fzf
    pkgs.glow
  ];
}
