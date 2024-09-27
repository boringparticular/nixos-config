{pkgs, ...}: {
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-hangul
    fcitx5-gtk
    libsForQt5.fcitx5-qt
    libsForQt5.fcitx5-with-addons
    fcitx5-lua
    kdePackages.fcitx5-qt
    kdePackages.fcitx5-with-addons
  ];
}
