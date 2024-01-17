{ config, pkgs, ... }:

{
  # load non-computer-specific settings
  imports = [
    ./hyprland.nix
  ];
  
  # set monitors
  wayland.windowManager.hyprland.settings = {
    monitor = [
    "eDP-1, 1920x1080@144,0x0,1.0"
    ];
    env = [
      "XCURSOR_SIZE,24"
      "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
    ];
  };
}
