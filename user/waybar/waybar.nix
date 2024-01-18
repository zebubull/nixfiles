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
      battery = {
        interval = 30;
        states = {
          full = 100;
          threeFour = 75;
          half = 50;
          critical = 25;
        };
        format-discharging-full = "{capacity}% 󰁹";
        format-discharging-threeFour = "{capacity}% 󰂀";
        format-discharging-half = "{capacity}% 󰁾";
        format-discharging-critical = "{capacity}% 󰂃";
        format-charging = "{capacity}% 󰂄";
        tooltip-format = "{power} W\n{timeTo}";
      };
      backlight = {
        format = "{percent}% ";
      };
      pulseaudio = {
        format = "{volume}% 󰓃";
        format-muted = "Muted 󰓄";
        format-bluetooth = "{volume}% 󰦢";
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

    #clock,
    #battery,
    #cpu,
    #memory,
    #network,
    #tray,
    #backlight,
    #pulseaudio,
    #temperature {
        padding: 0 10px;
        color: #ffffff;
    }

    #clock {
        border-radius: 10px;
        background-color: #c6a0f6;
        color: #000000;
    }

    #temperature {
        border-radius: 0 10px 10px 0;
        background-color: #c6a0f6;
        color: #000000;
    }

    #battery {
        background-color: #c6a0f6;
        color: #000000;
    }

    #battery.charging {
        color: #000000;
        background-color: #94e2d5;
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

    #cpu,
    #memory, 
    #backlight,
    #pulseaudio {
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

    #tray {
        background-color: transparent;
    }
  '';
}
