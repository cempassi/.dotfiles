{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    nixpkgs,
    home-manager,
    rust-overlay,
    ...
  }: {
    homeConfigurations."cedric.mpassi@C02Z762ELVCF" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [
        ./home/home.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
        })
      ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/configuration.nix
      ];
    };
  };
}
