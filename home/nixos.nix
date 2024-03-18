{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
    ./alacritty/alacritty.nix
  ];


  home = {
    username = "cempassi";
    homeDirectory = "/home/cempassi";
  };

  programs.zsh.shellAliases = {
      enix = "vim ~/.dotfiles/home/nixos.nix";
      switch = "sudo nixos-rebuild switch --flake \"$HOME/.dotfiles/.#nixos\"";
  };
}
