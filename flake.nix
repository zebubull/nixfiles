{

  description = "Epic Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    older-nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    muse-sounds-manager.url = "github:thilobillerbeck/muse-sounds-manager-nix";
  };

  outputs = {self, nixpkgs, home-manager, muse-sounds-manager, older-nixpkgs, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    old-nixpkgs = import older-nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };

    muse-sounds-overlay = final: prev: {
        muse-sounds-manager = muse-sounds-manager.packages.${system}.muse-sounds-manager;
    };

    old-discord-overlay = final: prev: {
      old-discord = old-nixpkgs.discord;
    };

    overlays = [ muse-sounds-overlay old-discord-overlay ];
    overlaysModule = { config, pkgs, ...}: {
        nixpkgs.overlays = overlays;
    };
    in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
        modules = [
        ./system/desktop.nix overlaysModule
        ];
      };
      rblade = lib.nixosSystem {
        inherit system;
        modules = [
        ./system/rblade.nix overlaysModule
        ];
      };
      rblade-nvidia = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/rblade-nvidia.nix overlaysModule
        ];
      };
    };
    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/desktop.nix ];
      };
      rblade = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/rblade.nix ];
      };
    };
  };

}
