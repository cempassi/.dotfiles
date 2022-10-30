{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = [
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
    (pkgs.nerdfonts.override {fonts = ["Hasklig"];})
  ];
}
