{ config, pkgs, ... }:

{
  # Could move this into one set but that's too much nesting
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

  # This is literally the default config but with some custom colors and programs
  wayland.windowManager.hyprland.settings = {
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
    ];
    env = [
      "XCURSOR_SIZE,24"
    ];
    input = {
      kb_layout = "us";
      follow_mouse = 0;
      touchpad.natural_scroll = "no";
      sensitivity = -0.1;
    };
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 4;
      "col.active_border" = "rgba(c6a0f6ee) rgba(8aadf4ee) 45deg";
      "col.inactive_border" = "rgba(94e2d5aa) rgba(89dcebaa) 45deg";
      layout = "dwindle";
      allow_tearing = false;
    };
    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };

      drop_shadow = "yes";
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

      active_opacity = 0.995;
      inactive_opacity = 0.95;
      fullscreen_opacity = 1.00;
    };
    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.06";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };
    master = {
      new_is_master = true;
    };
    gestures = {
      workspace_swipe = "off";
    };
    misc = {
      force_default_wallpaper = -1;
    };
    windowrulev2 = [
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "nofocus,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
    ];

    "$mainMod" = "SUPER";
    bind = [
      # app launching and other stuff
      "$mainMod, Q, exec, kitty"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod SHIFT, V, togglefloating,"
      "$mainMod, R, exec, rofi -show drun"
      "$mainMod, P, pseudo,"
      "$mainMod SHIFT, J, togglesplit,"
      "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      
      # vim-style focus changing
      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"
    ]
    ++ (
      # workspace bindings
      builtins.concatLists (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString(x + 1 - (c * 10));
        in [
          "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
          "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]
      )
      10)
    );
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
