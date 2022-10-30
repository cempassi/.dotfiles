{
  config,
  pkgs,
  ...
}: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./lldb/lldb.nix
    ./zsh/zsh.nix
    ./packages.nix
  ];

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
}
