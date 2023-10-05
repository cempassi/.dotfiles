{pkgs, ...}: {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  users.users.cempassi.home = "/Users/cempassi";
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    systemPackages = [
      pkgs.coreutils
      pkgs.rust-bin.stable.latest.default
    ];
    pathsToLink = [
      "/Applications"
      "/Users/cempassi/Applications"
    ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  # backwards compat; don't change
  system.stateVersion = 4;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Hasklig"];})];
  services.nix-daemon.enable = true;
  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  security.pam.enableSudoTouchIdAuth = true;
}
