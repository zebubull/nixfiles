{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/desktop.nix
     ./waybar/desktop.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    discord
    xwaylandvideobridge
  ];
}
