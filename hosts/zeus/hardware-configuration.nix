{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.extraModulePackages = [];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot.kernelModules = ["kvm-intel"];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NixOS";
    fsType = "btrfs";
    options = ["subvol=NixOS" "compress=zstd" "autodefrag"];
  };

  boot.initrd.luks.devices."luks-1d2ca45a-7928-48f1-87e2-9bc3566325ff".device = "/dev/disk/by-uuid/1d2ca45a-7928-48f1-87e2-9bc3566325ff";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/db033cfc-9a7f-442c-8701-dd8b2ceba5c4";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/51E0-EF0E";
    fsType = "vfat";
  };

  fileSystems."/games" = {
    device = "/dev/disk/by-label/NixOS";
    fsType = "btrfs";
    options = ["subvol=games" "compress=zstd" "autodefrag"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/data";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd" "autodefrag"];
  };

  boot.initrd.luks.devices."luks-1ab7702f-b001-4723-93e0-a6ae24ac7891".device = "/dev/disk/by-uuid/1ab7702f-b001-4723-93e0-a6ae24ac7891";

  fileSystems."/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "btrfs";
    options = ["subvol=data" "compress=zstd" "autodefrag"];
  };

  fileSystems."/data2" = {
    device = "/dev/disk/by-label/data2";
    fsType = "btrfs";
    options = ["compress=zstd" "autodefrag"];
  };

  boot.initrd.luks.devices."luks-6088390a-258c-4a84-849e-e989d2f9898c".device = "/dev/disk/by-uuid/6088390a-258c-4a84-849e-e989d2f9898c";

  fileSystems."/data3" = {
    device = "/dev/disk/by-label/data3";
    fsType = "btrfs";
    options = ["compress=zstd" "autodefrag"];
  };

  boot.initrd.luks.devices."luks-3bc633f5-62fd-4c1a-bb5e-1f20ffec6cf1".device = "/dev/disk/by-uuid/3bc633f5-62fd-4c1a-bb5e-1f20ffec6cf1";

  fileSystems."/games-ssd" = {
    device = "/dev/disk/by-label/ssd-2";
    fsType = "btrfs";
    options = ["subvol=games-ssd" "compress=zstd" "autodefrag"];
  };

  boot.initrd.luks.devices."luks-3ee2c64a-5397-487d-8571-24a56d0f09f3".device = "/dev/disk/by-uuid/3ee2c64a-5397-487d-8571-24a56d0f09f3";

  fileSystems."/swap" = {
    device = "/dev/disk/by-label/NixOS";
    fsType = "btrfs";
    options = ["subvol=swap" "noatime"];
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 20 * 1024;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
