{pkgs, ...}: let
  mkSudoPamReattachAuthScript = reattachPath: let
    file = "/etc/pam.d/sudo";
    option = "pam-reattach";
    sed = "${pkgs.gnused}/bin/sed";
  in ''
        # Enable sudo Touch ID authentication, if not already enabled
        if ! grep 'pam_reattach.so' ${file} > /dev/null; then
          ${sed} -i '2i\
    auth       optional     ${reattachPath}/lib/pam/pam_reattach.so # nix-darwin: ${option}
          ' ${file}
        fi
  '';
in {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  users.users.cempassi.home = "/Users/cempassi";
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/.dotfiles";
    };
    systemPackages = with pkgs; [
      coreutils
      pam-reattach
      rust-bin.stable.latest.default
    ];
    pathsToLink = [
      "/Applications"
    ];
  };

  nix.settings.trusted-users = [
    "root"
    "cempassi"
    "@admin"
  ];
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # backwards compat; don't change
  system.stateVersion = 4;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.packages = [(pkgs.nerdfonts.override {fonts = ["Hasklig"];})];
  services.nix-daemon.enable = true;
  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  security.pam.enableSudoTouchIdAuth = true;
  system.activationScripts.pam.text = ''
    # PAM settings
    echo >&2 "setting up pam-reattach..."
    ${mkSudoPamReattachAuthScript pkgs.pam-reattach}
  '';
}
