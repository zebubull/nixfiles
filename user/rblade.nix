{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/rblade.nix
     ./waybar/rblade.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  ];
}
