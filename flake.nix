{
  description = "My NixOS / Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    homeage.url = "github:jordanisaacs/homeage";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    rust-overlay,
    agenix,
    homeage,
    ...
  }: {
    homeConfigurations."cedric.mpassi@C02Z762ELVCF" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [
        homeage.homeManagerModules.homeage
        {
          homeage = {
            # Absolute path to identity (created not through home-manager)
            identityPaths = ["~/.ssh/id_ed25519"];

            # "activation" if system doesn't support systemd
            installationType = "activation";

            file."gitconfig-work" = {
              # Path to encrypted file tracked by the git repository
              source = ./.secrets/gitconfig-work.age;
              # Path expected by git config: (./home/git/git.nix:12)
              path = "/Users/cedric.mpassi/.config/git/work";
            };
          };
        }
        ./home/macos.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
        })
      ];
    };

    darwinConfigurations.Balamb = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./system/darwin.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cempassi = import ./home/macos.nix;
        }
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
        })
      ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/nixos.nix
        agenix.nixosModule
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cempassi = import ./home/nixos.nix;
        }
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
        })
      ];
    };
    macosX86 = self.homeConfigurations."cedric.mpassi@C02Z762ELVCF".activationPackage;
    defaultPackage.x86_64-darwin = self.macosX86;
    defaultPackage.aarch64-darwin = self.darwinConfigurations.Balamb.system;
    defaultPackage.x86_64-linux = self.nixosConfigurations.nixos;
  };
}
