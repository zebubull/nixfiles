{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];
  
  programs.waybar.settings = {
    mainBar = {
      modules-right = [
        "network"
        "cpu"
        "memory"
        "pulseaudio"
        "backlight"
        "battery"
        "temperature"
      ];
    };
  };
}
