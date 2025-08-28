{
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
    ./alacritty/alacritty.nix
  ];

  home = {
    sessionVariables = {
      MAIL = "cempassi@student.42.fr";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };

    packages = [

      # Dev dependencies
      (pkgs.google-cloud-sdk.withExtraComponents (with pkgs.google-cloud-sdk.components; [
        gke-gcloud-auth-plugin
        cloud-run-proxy
      ]))
      pkgs.protobuf
      pkgs.go
      pkgs.nixos-generators
    ];
  };

  programs.zsh.shellAliases = {
    enix = "vim ~/.dotfiles/home/defaults.nix";
    switch = "sudo darwin-rebuild switch --flake ~/.dotfiles";
  };
}
