{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
  ];

  home = {
    sessionVariables = {
      NODE_EXTRA_CA_CERTS = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };
  };

  programs.zsh.shellAliases = {
    enix = "vim ~/.dotfiles/home/macos.nix";
  };
}
