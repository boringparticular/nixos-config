{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";

    pointerCursor = {
      enable = true;
    };
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;

      icon = {
        enable = true;
      };
    };

    font = {
      name = "NotoSans Nerd Font";
      size = 12;
      package = pkgs.nerdfonts.override {
        fonts = ["Noto"];
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      catppuccin.enable = true;
      catppuccin.apply = false;
      name = "kvantum";
      catppuccin.flavor = "mocha";
      catppuccin.accent = "lavender";
    };
  };

  home.pointerCursor = {
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
}
