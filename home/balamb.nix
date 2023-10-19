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

      # Rust
      (pkgs.rust-bin.stable.latest.default.override {
        extensions = ["rust-analyzer" "rust-src"];
      })
    ];
  };

  programs.zsh.shellAliases = {
    enix = "vim ~/.dotfiles/home/macos.nix";
  };
}
