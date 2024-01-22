{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./lldb/lldb.nix
    ./neovim/neovim.nix
    ./tmux/tmux.nix
    ./zsh/zsh.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home = {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";

    sessionPath = [
      "$HOME/.luarocks/bin" # Lua
      "$HOME/.tfenv/bin" # Terraform
      "$HOME/.rd/bin" # Rancher Desktop
      "$HOME/.nix-profile/bin" #Nix profile
      "/nix/var/nix/profiles/default/bin" # Nix Default
    ];

    sessionVariables = {
      LSCOLORS = "exfxcxdxbxegedabagacad";
      SSH_KEY_PATH = "~/.ssh/rsa_id";
      BAT_THEME = "Nord";
      KEYTIMEOUT = 1;
      PAGER = "bat --paging=auto --plain";
    };

    packages = [
      # Rust
      (pkgs.rust-bin.stable.latest.default.override {
        extensions = ["rust-analyzer" "rust-src"];
      })

      # Rust Cli tools
      pkgs.ripgrep
      pkgs.tokei
      pkgs.delta
      pkgs.bat
      pkgs.eza
      pkgs.zoxide
      pkgs.fd
      pkgs.bottom
      pkgs.diskonaut
      pkgs.du-dust
      pkgs.rage
      pkgs.onefetch
      pkgs.bandwhich
      pkgs.rsync
      pkgs.websocat

      # Java
      pkgs.jdk19_headless
      pkgs.maven
      pkgs.gradle
      pkgs.lombok

      # Containers
      pkgs.podman
      pkgs.colima

      # Kubernetes
      pkgs.kubectl
      pkgs.kind
      pkgs.kube3d

      # Utils
      pkgs.bash
      pkgs.bitwarden-cli
      pkgs.jq
      pkgs.fzf
      pkgs.ncurses6

      # JS
      pkgs.yarn
      pkgs.nodePackages.rimraf


      # Python
      pkgs.pyenv
      pkgs.poetry
      pkgs.python311Packages.pynvim

      # font
      (pkgs.nerdfonts.override {fonts = ["Hasklig"];})
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
