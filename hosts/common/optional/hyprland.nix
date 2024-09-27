{
  pkgs,
  inputs,
  ...
}: {
  services.displayManager.defaultSession = "hyprland";
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  security.pam.services.hyprlock = {};
}
