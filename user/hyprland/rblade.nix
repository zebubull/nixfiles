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
    exec-once = [
      "waybar"
      "mako"
      "wl-paste --type text --watch cliphist store #Stores only text data"
      "wl-paste --type image --watch cliphist store #Stores only image data"
      # for some reason pipewire doesn't get started by default
      # maybe it does but it didn't one time so make sure it does
      "systemctl --user restart pipewire.service"
      "systemctl --user restart pipewire-pulse.service"
      "fcitx5"
      "hyprctl setcursor Vimix-cursors 32"
      "swww init"
     ];
    env = [
      "XCURSOR_SIZE,24"
      "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
    ];
    input = {
      kb_layout = "us";
      follow_mouse = 0;
      sensitivity = 0.0;
      kb_options = "ctrl:nocaps";
      touchpad = {
        natural_scroll = "no";
        tap-to-click = "no";
        clickfinger_behavior = true;
      };
    };
    decoration = {
      blur = {
        enabled = false;
      };

      drop_shadow = "no";
    };
    misc = {
      vfr = true;
    };
  };
}
