{ config, pkgs, ... }:

{
  # Could move this into one set but that's too much nesting
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

  # This is literally the default config but with some custom colors and programs
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 4;
      "col.active_border" = "rgba(eb6f92ee) rgba(ea9a97ee) 45deg";
      "col.inactive_border" = "rgba(f6c177aa) rgba(3e8fb0aa) 45deg";
      layout = "dwindle";
      allow_tearing = false;
    };
    decoration = {
      rounding = 10;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

      active_opacity = 0.995;
      inactive_opacity = 0.80; fullscreen_opacity = 1.00;
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
      force_default_wallpaper = 2;
    };
    windowrulev2 = [
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "opacity 1.0 override 1.0 override,title:(.*)(Mozilla Firefox)$"
      "opacity 1.0 override 1.0 override,title:(.*)(- Discord)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "nofocus,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
    ];

    "$mainMod" = "SUPER";
    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-"
      "SHIFT, XF86AudioRaiseVolume, exec, mpc volume +2"
      "SHIFT, XF86AudioLowerVolume, exec, mpc volume -2"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];
    bind = [
      # app launching and other stuff
      "$mainMod, Q, exec, kitty"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod SHIFT, V, togglefloating,"
      "$mainMod, R, exec, rofi -show drun"
      "$mainMod SHIFT, J, togglesplit,"
      "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$mainMod, F, exec, /home/zebubull/.config/eww/dashboard/launch_dashboard"
      "$mainMod, P, exec, /home/zebubull/.config/eww/music_player/launch_player"
      "$mainMod, S, exec, /home/zebubull/.config/eww/bar/launch_bar"
      "$mainMod SHIFT, E, exec, pkill eww"
      # vim-style focus changing
      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"

      ", XF86AudioPlay, exec, playerctl play-pause"
      "SHIFT, XF86AudioPlay, exec, mpc toggle"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

      # lock screen
      "$mainMod SHIFT,L,exec,swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --ring-color 584678 --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0.2"
      "$mainMod SHIFT, s, exec, grim -g \"$(slurp -d)\" - | wl-copy"
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
      "$mainMod SHIFT, mouse:272, resizewindow"
    ];
  };
}
