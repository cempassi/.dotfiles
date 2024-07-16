{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./defaults.nix
    ./alacritty/alacritty.nix
  ];

  home = {
    username = "cedric.mpassi";
    homeDirectory = "/Users/cedric.mpassi";
    sessionVariables = {
      ZSH_DISABLE_COMPFIX = "true" ;
      NODE_EXTRA_CA_CERTS = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_CONFIG="experimental-features = nix-command flakes";
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
    switch = "home-manager switch --flake /Users/cedric.mpassi/.dotfiles";
    enix = "vim ~/.dotfiles/home/work.nix";
  };
}
