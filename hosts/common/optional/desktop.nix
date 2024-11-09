{
  pkgs,
  lib,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;

  time.timeZone = "Europe/Berlin";

  networking.firewall.enable = lib.mkDefault false;
}
