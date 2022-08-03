{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "cempassi";
    homeDirectory = "/Users/cedric.mpassi";

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

    shellAliases = {
      ls = "exa --icons ";
      ll = "exa -1 --icons ";
      lt = "exa -T --icons ";
      le = "exa -lah --icons --ignore-glob='.git' ";
      cd = "z";
      status = "git status";
      norme = "clear && norminette";
      szsh = "source ~/.zshrc";
      ezsh = "vim ~/.zshrc";
      evim = "vim ~/.config/nvim/init.vim";
      enix = "vim ~/.config/nixpkgs/home.nix";
      uconf = "~/.config/update_config.sh";
      cat = "bat";
      switch = "home-manager switch";
      dvim = "nvim --cmd \"set rtp+=$PWD\"";
      space = "dust ~";
      vim = "nvim ";
    };

    initExtra = ''
      . $HOME/.dotfiles/zsh/.zshrc
      . "$HOME/.cargo/env"
    '';
  };

  home.packages = [
    # Text Editor
    pkgs.neovim
    pkgs.terraform-ls
    pkgs.stylua
    pkgs.black
    pkgs.selene
    pkgs.shfmt
    pkgs.nodePackages.yaml-language-server

    # Rust Alternatives
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
  ];
}
