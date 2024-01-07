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
      MAIL = "cempassi@student.42.fr";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };

    packages = [
      # Code managers
      pkgs.gh

    ];
  };

  programs.zsh.shellAliases = {
    enix = "vim ~/.dotfiles/home/defaults.nix";
    switch = "darwin-rebuild switch --flake ~/.dotfiles";
  };
}
