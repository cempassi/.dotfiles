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
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };

    packages = [
      # Code managers
      pkgs.gh

    ];
  };

  programs.zsh.shellAliases = {
    enix = "vim ~/.dotfiles/home/macos.nix";
  };
}
