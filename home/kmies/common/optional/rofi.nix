{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "$TERMINAL";
    extraConfig = {
      modi = "combi,run,drun,window,ssh";
      show-icons = true;
      combi-modi = "run,drun";
    };
    catppuccin.enable = false;
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#1e1e2e";
        hv = mkLiteral "#b4befe";
        primary = mkLiteral "#C5C8C6";
        ug = mkLiteral "#0B2447";
        font = "Jetbrains Mono Nerd Font 11";
        background-color = mkLiteral "@bg";
        # dark = mkLiteral "#1e1e2e";
        border = mkLiteral "0px";
        kl = mkLiteral "#b4befe";
        black = mkLiteral "#000000";
        transparent = mkLiteral "rgba(46,52,64,0)";
      };

      # defines different aspects of the window
      window = {
        width = mkLiteral "700";
        /*
          since line wont work with height, i comment it out
        if you rather control the size via height
        just comment it out
        */
        # height = 500;

        orientation = mkLiteral "horizontal";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        # transparency = mkLiteral "screenshot";
        border-color = mkLiteral "#1e1e2e";
        border = mkLiteral "0px";
        border-radius = mkLiteral "7px";
        spacing = 0;
        children = mkLiteral "[ mainbox ]";
      };

      mainbox = {
        spacing = 0;
        children = mkLiteral "[ inputbar, message, listview ]";
      };

      inputbar = {
        color = mkLiteral "@kl";
        padding = mkLiteral "11px";
        border = mkLiteral "3px 3px 2px 3px";
        border-color = mkLiteral "#b4befe";
        border-radius = mkLiteral "6px 6px 0px 0px";
      };

      message = {
        padding = 0;
        border-color = mkLiteral "@primary";
        border = mkLiteral "0px 1px 1px 1px";
      };

      " entry, prompt, case-indicator" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      entry = {
        cursor = mkLiteral "pointer";
      };

      prompt = {
        margin = mkLiteral "0px 5px 0px 0px";
      };

      listview = {
        layout = mkLiteral "vertical";
        # spacing = mkLiteral "5px";
        padding = mkLiteral "8px";
        lines = 12;
        columns = 1;
        border = mkLiteral "0px 3px 3px 3px";
        border-radius = mkLiteral "0px 0px 6px 6px";
        border-color = mkLiteral "#b4befe";
        dynamic = false;
      };

      element = {
        padding = mkLiteral "2px";
        vertical-align = 1;
        color = mkLiteral "@kl";
        font = mkLiteral "inherit";
      };

      element-text = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element selected.normal" = {
        color = mkLiteral "@black";
        background-color = mkLiteral "@hv";
      };

      "element normal active" = {
        background-color = mkLiteral "@hv";
        color = mkLiteral "@black";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element normal urgent" = {
        background-color = mkLiteral "@primary";
      };

      "element selected active" = {
        background = mkLiteral "@hv";
        foreground = mkLiteral "@bg";
      };

      button = {
        padding = mkLiteral "6px";
        color = mkLiteral "@primary";
        horizonatal-align = mkLiteral "0.5";

        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "@primary";
      };

      "button selected normal" = {
        border = mkLiteral "2px 0px 2px 2px";
        border-color = mkLiteral "@primary";
      };

      scrollbar = {
        enabled = true;
      };
    };
  };
}
