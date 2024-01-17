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
    exec-once = [
      "waybar"
      "mako"
      "wl-paste --type text --watch cliphist store #Stores only text data"
      "wl-paste --type image --watch cliphist store #Stores only image data"
      # for some reason pipewire doesn't get started by default
      # maybe it does but it didn't one time so make sure it does
      "systemctl --user restart pipewire.service"
      "systemctl --user restart pipewire-pulse.service"
      "pactl load-module module-loopback"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "xwaylandvideobridge"
      "fcitx5"
    ];
    env = [
      "XCURSOR_SIZE,32"
    ];
  };
}
