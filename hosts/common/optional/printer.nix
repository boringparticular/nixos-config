{pkgs, ...}: {
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [
    pkgs.hplip
  ];

  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
