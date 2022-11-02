{
  description = "My NixOS / Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    agenix,
    ...
  }: {
    homeConfigurations."cedric.mpassi@C02Z762ELVCF" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [
        ./home/macos.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
        })
      ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/configuration.nix
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

    macos = self.homeConfigurations."cedric.mpassi@C02Z762ELVCF".activationPackage;
    defaultPackage.x86_64-darwin = self.macos;
    defaultPackage.x86_64-linux = self.nixosConfigurations.nixos;
  };
}
