{ config, pkgs, ... }:

{
  # load non-computer-specific settings
  imports = [
    ./hyprland.nix
  ];

  # set monitors
  wayland.windowManager.hyprland.settings = {
    monitor = [
    "DP-2,3840x2160@60,3840x0,1.0"
    "DP-3,3840x2160@60,0x0,1.0"
    ];
    exec-once = [
      "mako"
      "mpd-notification"
      "wl-paste --type text --watch cliphist store #Stores only text data"
      "wl-paste --type image --watch cliphist store #Stores only image data"
      # for some reason pipewire doesn't get started by default
      # maybe it does but it didn't one time so make sure it does
      "systemctl --user restart pipewire.service"
      "systemctl --user restart pipewire-pulse.service"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "xwaylandvideobridge"
      "fcitx5"
      "hyprctl setcursor Vimix-cursors 24"
      "swww-daemon"
      "lxqt-policykit-agent"
      "/home/zebubull/.config/eww/bar/launch_bar"
    ];
    decoration = {
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };

      drop_shadow = "yes";
    };
    env = [
      "XCURSOR_SIZE,32"
    ];
    input = {
      kb_layout = "us";
      follow_mouse = 0;
      touchpad.natural_scroll = "no";
      sensitivity = -0.1;
    };
    workspace = [
      "1,monitor:1,default:true"
      "2,monitor:0,default:true"
    ];
  };
}
