{

  description = "Epic Flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
        modules = [ ./system/desktop.nix ];
      };
      rblade = lib.nixosSystem {
        inherit system;
        modules = [ ./system/rblade.nix ];
      };
    };
    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/desktop.nix ];
      };
    };
  };

}
