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
      MAVEN_OPTS = "-Djavax.net.ssl.trustStore=/Users/cedric.mpassi/.local/certs/nexus.crt -Djavax.net.ssl.trustStorePassword=changeit";
    };

    packages = [
      # Code manager
      pkgs.glab

      # Jira
      pkgs.jira-cli-go

      # Python
      (pkgs.python3.withPackages (ps:
        with ps; [
          pkgs.python311Packages.boto3
          pkgs.python311Packages.botocore
          pkgs.python311Packages.requests
          pkgs.python311Packages.beautifulsoup4
          pkgs.python311Packages.truststore
        ]))

      # Utils
      pkgs.awscli2
      pkgs.ssm-session-manager-plugin
    ];
  };

  programs.zsh.shellAliases = {
    switch = "home-manager switch";
    rebond = "(unset LC_ALL ; TERM=xterm-256color ssh aws)";
    enix = "vim ~/.dotfiles/home/work.nix";
    hack = "sudo dscl . -append /groups/admin GroupMembership cedric.mpassi";
  };
}
