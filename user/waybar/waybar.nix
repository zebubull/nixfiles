{ config, pkgs, ... }:

{
  programs.waybar.enable = true;
  
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 4;
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "clock"
      ];
      clock = {
        format = "{:%I:%M %p %A, %B %d, %Y}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%I:%M %p}";
      };
      cpu = {
        format = "{usage}% ";
      };
      memory = {
        format = "{}% ";
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureF}° ";
      };
      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
    };
  };

  programs.waybar.style = ''
    * {
        border: none;
        font-family: Cousine  Nerd Font;
        font-size: 15px;
    }

    window#waybar {
        background-color: rgba(43, 48, 59, 0);
        transition-property: background-color;
        transition-duration: .5s;
        opacity: 0.75;
    }

    #window {
      color: #c6a0f6;
    }

    window#waybar.hidden {
        opacity: 0.2;
    }

    #workspaces {
        background-color: black;
        border: 2px solid #c6a0f6;
        border-radius: 10px;
    }

    #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #8a8a8a;
    }

    #workspaces button:hover {
        box-shadow: inherit;
    }

    #workspaces button.focused {
        color: #ffffff;
    }

    #workspaces button.urgent {
        background-color: #c6a0f6;
        color: #000000;
    }

    #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
    }

    #clock,
    #battery,
    #cpu,
    #memory,
    #network,
    #pulseaudio,
    #custom-media,
    #tray,
    #mode,
    #idle_inhibitor,
    #keyboard-state,
    #temperature,
    #mpd {
        padding: 0 10px;
        color: #ffffff;
    }

    #clock {
        border-radius: 10px;
        background-color: #c6a0f6;
        color: #000000;
    }

    #keyboard-state {
        border-radius: 10px;
        background-color: #c6a0f6;
    }

    #temperature {
        border-radius: 0 10px 10px 0;
        background-color: #c6a0f6;
        color: #000000;
    }

    #keyboard-state > * {
        color: #000000;
    }

    #battery {
        background-color: #c6a0f6;
        border-radius: 0 10px 10px 0;
        color: #000000;
    }

    #battery.charging {
        color: #000000;
        background-color: #0bda51;
    }

    #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }

    label:focus {
        background-color: #000000;
    }

    #cpu {
        background-color: #c6a0f6;
        color: #000000;
    }

    #memory {
        background-color: #c6a0f6;
        color: #000000;
    }

    #network {
        background-color: #c6a0f6;
        border-radius: 10px 0 0 10px;
        color: #000000;
    }

    #network.disconnected {
        background-color: #f53c3c;
    }

    #pulseaudio {
        background-color: #c6a0f6;
        color: #000000;
    }

    #custom-media {
        background-color: #66cc99;
        color: #2a5c45;
        min-width: 100px;
    }

    #custom-media.custom-spotify {
        background-color: #66cc99;
    }

    #custom-media.custom-vlc {
        background-color: #ffa000;
    }

    #tray {
        background-color: transparent;
    }

    #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
    }

    #mpd {
        background-color: #66cc99;
        color: #2a5c45;
    }

    #mpd.disconnected {
        background-color: #f53c3c;
    }

    #mpd.stopped {
        background-color: #90b1b1;
    }

    #mpd.paused {
        background-color: #51a37a;
    }
  '';
}
