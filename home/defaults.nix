{ config
, pkgs
, ...
}: {
  imports = [
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./lldb/lldb.nix
    ./neovim/neovim.nix
    ./zsh/zsh.nix
    ./packages.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";

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

    packages = [
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

      # Rust dev setup
      pkgs.rust-bin.stable.latest.default

      # Code managers
      pkgs.gh
      pkgs.glab

      # Utils
      pkgs.bash
      pkgs.bitwarden-cli
      pkgs.tmux
      pkgs.jq
      pkgs.fzf
      pkgs.ncurses6
      pkgs.kube3d

      # font
      (pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; })
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
