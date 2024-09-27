{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    configPackages = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = ["gtk"];
  };
}
