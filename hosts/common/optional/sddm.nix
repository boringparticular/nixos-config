{pkgs, ...}: {
  services.displayManager = {
    sddm = {
      enable = false;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
    };
  };
  services.xserver = {
    enable = true;
    displayManager = {
      gdm = {
        enable = true;
      };
    };
  };
}
