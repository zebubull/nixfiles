{ config, pkgs, ... }:

{
  # load non-computer-specific settings
  imports = [
    ./hyprland.nix
  ];
  
  # set monitors
  wayland.windowManager.hyprland.settings = {
    monitor = [
    "DP-1, 3840x2160@60,0x0,1.50"
    "HDMI-A-1,3840x2160@60,2560x0,1.50"
    ];
    env = [
      "XCURSOR_SIZE,32"
    ];
  };
}
