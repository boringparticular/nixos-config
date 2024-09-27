{
  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 32;
        spacing = 4;
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "wireplumber"
          "network"
          "cpu"
          "memory"
          "temperature"
          "clock"
          "tray"
        ];
        "hyprland/workspaces" = {
          "format" = "{name}: {icon}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "active" = "";
            "default" = "";
          };
        };
        "hyprland/window" = {
          max-length = 200;
          separate-outputs = true;
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C ";
        };

        idle_inhibitor = {
          format = "{icon}";

          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "󰖁";
          format-icons = ["" "" ""];
          on-click = "helvum";
        };

        clock = {
          timezone = "Europe/Berlin";
          # format = "󰸗 {:%d.%m.%Y  %H:%M}";
          format = "{:%H:%M  %d.%m.%Y 󰸗}";
          tooltip = true;
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
            format = {
              months = "<span color='#f2cdcd'><b>{}</b></span>";
              days = "<span color='#f5e0dc'><b>{}</b></span>";
              weeks = "<span color='#94e2d5'><b>W{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              today = "<span color='#eba0ac'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        tray.spacing = 10;

        cpu = {
          format = "{usage}% 󰻠";
          tooltip = true;
        };

        memory.format = "{}% 󰍛";

        network = {
          # interface = "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
      }
    ];
    style =
      /*
      css
      */
      ''
        * {
          font-family: "NotoSans Nerd Font";
          font-size: 15px;
          color: @text;
        }

        window#waybar {
          /* you can also GTK3 CSS functions! */
          background-color: shade(@base, 0.9);
          border: 2px solid alpha(@crust, 0.3);
        }

        #window,
        #workspaces {
          margin: 0 4px;
        }

        #idle_inhibitor,
        #wireplumber,
        #network,
        #memory,
        #cpu,
        #temperature,
        #keyboard-state,
        #disk,
        #clock,
        #tray {
          padding: 0 10px;
        }

        #clock {
          color: @mauve;
        }

        #cpu {
            color: @teal;
        }

        #memory {
          color: @green;
        }

        #disk {
          color: @flamingo;
        }

        #network {
          color: @blue;
        }

        #network.disconnected {
            background-color: @red;
        }

        #temperature {
          color: @peach;
        }

        #temperature.critical {
            background-color: @red;
        }

        #tray {
          color: @crust;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: @red;
        }

        #wireplumber {
            color: @lavender;
        }

        #wireplumber.muted {
            background-color: @red;
        }

        #workspaces button {
          padding: 0 0.5em;
          background-color: @surface0;
          color: @text;
          margin: 0.25em;
        }

        #workspaces button.empty {
            color: @overlay0;
        }

        #workspaces button.visible {
            color: @blue;
        }

        #workspaces button.active {
            color: @green;
        }

        #workspaces button.urgent {
          background-color: @red;
          border-radius: 1em;
          color: @text;
        }
      '';
    systemd.enable = true;
  };
}
