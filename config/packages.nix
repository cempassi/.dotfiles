{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    # Text Editor
    pkgs.neovim
    pkgs.terraform-ls
    pkgs.stylua
    pkgs.black
    pkgs.selene
    pkgs.shfmt
    pkgs.alejandra
    pkgs.sumneko-lua-language-server
    pkgs.nodePackages.yaml-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.typescript
    pkgs.nodePackages.pyright
    pkgs.nodePackages.prettier
    pkgs.rnix-lsp

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

    # Code managers
    pkgs.gh
    pkgs.glab

    # Utils
    pkgs.bash
    pkgs.stow
    pkgs.bitwarden-cli
    pkgs.tmux
    pkgs.jq
    pkgs.fzf
    pkgs.glow
    pkgs.ncurses6
    pkgs.kube3d
  ];
}
