{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
  ];

  home = {
    username = "cedric.mpassi";
    homeDirectory = "/Users/cedric.mpassi";
    sessionVariables = {
      NODE_EXTRA_CA_CERTS = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_SSL_CERT_FILE = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
      MAVEN_OPTS = "-Djavax.net.ssl.trustStore=/Users/cedric.mpassi/.local/certs/pmutruststore.jks -Djavax.net.ssl.trustStoreType=jks -Djavax.net.ssl.trustStorePassword=pmupmu";
    };
  };

  programs.zsh.shellAliases = {
    switch = "home-manager switch";
    enix = "vim ~/.dotfiles/home/macos.nix";
  };
}
