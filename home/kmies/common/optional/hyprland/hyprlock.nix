{config, ...}: let
  inherit (config.catppuccin) sources;
  cfg = config.wayland.windowManager.hyprland.catppuccin;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      source = ["${sources.hyprland}/themes/${cfg.flavor}.conf"];
      "$accent" = "\$${cfg.accent}";
      "$aA" = "\$${cfg.accent}Alpha";
      "$tA" = "$textAlpha";
      "$font" = "Noto Sans Nerd Font";

      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 15;
      };

      background = [
        # BACKGROUND
        {
          monitor = "HDMI-A-1";
          blur_passes = 0;
          path = "$HOME/bg2560.png";
          color = "$base";
        }
        {
          monitor = "DVI-D-1";
          blur_passes = 0;
          path = "$HOME/bg1920.png";
          color = "$base";
        }
      ];

      label = [
        # LAYOUT
        {
          monitor = "";
          text = "Layout: $LAYOUT";
          color = "$text";
          font_size = 25;
          font_family = "$font";
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
        # TIME
        {
          monitor = "";
          text = "$TIME";
          color = "$text";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        # DATE
        {
          monitor = "";
          text = "cmd[update:43200000] date +'%A, %d %B %Y'";
          color = "$text";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      input-field = [
        # INPUT FIELD
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "$accent";
          inner_color = "$surface0";
          font_color = "$text";
          fade_on_empty = false;
          placeholder_text = "<span foreground='##$tA'><i>󰌾 Logged in as </i><span foreground='##$aA'>$USER</span></span>";
          hide_input = false;
          check_color = "$accent";
          fail_color = "$red";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "$yellow";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];

      # USER AVATAR
      image = {
        monitor = "";
        path = "$HOME/.face";
        size = 100;
        border_color = "$accent";
        position = "0, 75";
        halign = "center";
        valign = "center";
      };
    };
  };
}
