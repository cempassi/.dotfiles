{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home = {
    username = "cempassi";
    homeDirectory = "/home/cempassi";
  };

  programs.zsh.shellAliases = {
      enix = "vim ~/.dotfiles/home/nixos.nix";
      switch = "sudo nixos-rebuild switch --flake \"$HOME/.dotfiles/.#nixos\"";
  };
}
