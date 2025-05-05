{
  description = "My NixOS / Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

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
    alacritty-theme,
    rust-overlay,
    agenix,
    homeage,
    ...
  }: {
    devShells.aarch64-darwin.python39 = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      nativeBuildInputs = with nixpkgs; let
        devpython =
          nixpkgs.legacyPackages.aarch64-darwin.python39.withPackages
          (packages: with packages; [virtualenv pip setuptools wheel]);
      in [devpython];
    };

    homeConfigurations."cedric.mpassi@WJETAG-MXH5HD23NKV" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [
        ./home/work.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [
            rust-overlay.overlays.default
            alacritty-theme.overlays.default
          ];
        })
      ];
    };

    darwinConfigurations.Balamb = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./system/darwin.nix
        home-manager.darwnModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cempassi = import ./home/balamb.nix;
        }
        ({pkgs, ...}: {
          nixpkgs.overlays = [
            rust-overlay.overlays.default
            alacritty-theme.overlays.default
          ];
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
          nixpkgs.overlays = [
            rust-overlay.overlays.default
            alacritty-theme.overlays.default
          ];
        })
      ];
    };

    nixosConfigurations.galbadia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/galbadia.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cempassi = import ./home/nixos.nix;
        }
        ({pkgs, ...}: {
          nixpkgs.overlays = [
            rust-overlay.overlays.default
            alacritty-theme.overlays.default
          ];
        })
      ];
    };
  };
}
