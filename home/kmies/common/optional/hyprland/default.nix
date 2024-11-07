{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./waybar.nix
  ];

  gtk = {
    gtk2.extraConfig = ''
      gtk-im-module="fcitx"
    '';
    gtk3.extraConfig = {
      gtk-im-module = "fcitx";
    };
    gtk4.extraConfig = {
      gtk-im-module = "fcitx";
    };
  };

  home.packages = with pkgs; [
    hyprpicker
    helvum
    waybar
    nwg-look
    cliphist
    wl-clipboard
    rofi-wayland
    grim
    slurp
    grimblast
  ];

  # TODO: Add option for monitor definition
  wayland.windowManager.hyprland = let
    startupScript = pkgs.writeShellScriptBin "start" ''
      ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
      wl-paste --type text --watch cliphist store & #Stores only text data
      wl-paste --type image --watch cliphist store & #Stores only image data
      systemctl --user restart waybar
    '';
  in {
    enable = true;
    catppuccin.enable = true;
    plugins = [
    ];
    settings = {
      exec-once = "${startupScript}/bin/start";
      monitor = [
        "HDMI-A-1,2560x1080,0x0,1"
        "DVI-D-1,1920x1080,2560x0,1"
      ];
      general = {
        border_size = 5;
      };
      decoration = {
        rounding = 5;
      };
      input = {
        kb_layout = "us,kr";
        kb_variant = "altgr-intl,";
        follow_mouse = 2;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      workspace = [
        "1,monitor:HDMI-A-1"
        "2,monitor:HDMI-A-1"
        "3,monitor:HDMI-A-1"
        "4,monitor:HDMI-A-1"
        "5,monitor:HDMI-A-1"
        "6,monitor:HDMI-A-1"
        "7,monitor:HDMI-A-1"
        "8,monitor:DVI-D-1"
        "9,monitor:DVI-D-1"
        "special:minimized"
        "special:scratchpad"
      ];

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, RETURN, exec, foot"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod_SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod_SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod_SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod_SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod_SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod_SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod_SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod_SHIFT, 9, movetoworkspacesilent, 9"

        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        "$mainMod_SHIFT, H, movewindow, l"
        "$mainMod_SHIFT, J, movewindow, d"
        "$mainMod_SHIFT, K, movewindow, u"
        "$mainMod_SHIFT, L, movewindow, r"

        "$mainMod, C, movetoworkspace, special"

        "$mainMod, TAB, focuscurrentorlast"

        "$mainMod, S, pseudo,"
        "$mainMod, SPACE, togglefloating,"
        "$mainMod, D, exec, rofi -show combi"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, F, fullscreen,1"
        "$mainMod_SHIFT, F, fullscreen,"
        "$mainMod, O, movewindow, mon:+1"
        "$mainMod, Q, killactive"
        "$mainMod_SHIFT, Q, exit"
        "$mainMod_SHIFT, R, exec, hyprctl reload"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod_CTRL, A, cyclenext,"
        "$mainMod_CTRL, S, swapnext,"
        "$mainMod_CTRL, D, fakefullscreen,"

        "$mainMod, Print, exec, grim -g \"$(slurp)\""
        "$mainMod_SHIFT, Print, exec, grim -g \"$(slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy"

        "$mainMod, m, movetoworkspacesilent, special:minimized"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # NOTE: This is a hack to open wezterm. Currently it won't open otherwise
      windowrule = [
        "float,^(wezterm)$"
      ];

      # TODO: Remove when catppuccin nix sets cursors correctyl
      env = [
        "HYPRCURSOR_THEME,catppuccin-mocha-lavender-cursors"
        "HYPRCURSOR_SIZE,32"
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland
        "MOZ_WEBRENDER,1"

        # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
        # fcitx stuff
        # "GTK_IM_MODULE,fcitx"
        "QT_IM_MODULE,fcitx"
        "QT_IM_MODULES,wayland;fcitx;ibus"
        # "GTK_IM_MODULE,wayland"
        "GTK_IM_MODULE,"
        "XMODIFIERS,@im=fcitx"

        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland,x11,*"
      ];
    };
    extraConfig = ''
      bind = $mainMod, escape, submap, power
      submap = power

      bind = , L, exec, hyprlock
      bind = , L, submap, reset

      bind = , S, exec, systemctl suspend
      bind = , S, submap, reset

      bind = , R, exec, systemctl reboot
      bind = , R, submap, reset

      bind = , P, exec, systemctl poweroff
      bind = , P, submap, reset

      # bind = , H, exec, hyprlock && systemctl hibernate
      bind = , H, exec, systemctl hibernate
      bind = , H, submap, reset

      # bind = SHIFT, H, exec, hyprlock && systemctl suspend-then-hibernate
      bind = SHIFT, H, exec, systemctl suspend-then-hibernate
      bind = SHIFT, H, submap, reset

      # bind = , escape, submap, reset
      bind = , catchall, submap, reset

      submap = reset

      bind = $mainMod, R, submap, resize
      submap = resize
      binde = , H, resizeactive, -10 0
      binde = , L, resizeactive, 10 0
      binde = , K, resizeactive, 0 -10
      binde = , J, resizeactive, 0 10
      bind = , escape, submap, reset
      submap = reset

      # TODO: Remove when catppuccin nix sets cursors correctyl
      env = HYPRCURSOR_THEME,catppuccin-mocha-lavender-cursors
      env = HYPRCURSOR_SIZE,32
    '';
  };
}
