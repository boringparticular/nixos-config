{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  defaultMountOptions = ["compress=zstd" "autodefrag" "space_cache=v2"];
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.initrd.luks.devices."luks_nixos".device = "/dev/disk/by-uuid/1d2ca45a-7928-48f1-87e2-9bc3566325ff";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/28691f52-a981-49cc-895c-966f4865743e";
    fsType = "btrfs";
    options = ["subvol=NixOS" "ssd" "discard=async"] ++ defaultMountOptions;
  };

  boot.initrd.luks.devices."luks_old_data".device = "/dev/disk/by-uuid/1ab7702f-b001-4723-93e0-a6ae24ac7891";

  # fileSystems."/old-home" = {
  #   device = "/dev/disk/by-uuid/c73dcec9-1890-4d28-9516-71e74a4c9f84";
  #   fsType = "btrfs";
  #   options = ["subvol=home"] ++ defaultMountOptions;
  # };

  # fileSystems."/old-data" = {
  #   device = "/dev/disk/by-uuid/c73dcec9-1890-4d28-9516-71e74a4c9f84";
  #   fsType = "btrfs";
  #   options = ["subvol=data"] ++ defaultMountOptions;
  # };

  boot.initrd.luks.devices."luks_data".device = "/dev/disk/by-uuid/39d20e66-08d6-40b7-b553-bf1870ed6f98";

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/f8244f41-0a9b-49b5-a671-56f87c350443";
    fsType = "btrfs";
    options = ["subvol=@data" "ssd"] ++ defaultMountOptions;
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/f8244f41-0a9b-49b5-a671-56f87c350443";
    fsType = "btrfs";
    options = ["subvol=@home" "ssd"] ++ defaultMountOptions;
  };

  boot.initrd.luks.devices."luks_data2".device = "/dev/disk/by-uuid/6088390a-258c-4a84-849e-e989d2f9898c";

  fileSystems."/data2" = {
    device = "/dev/disk/by-uuid/51e17668-a159-4e20-ac78-043e5ac470d9";
    fsType = "btrfs";
    options = defaultMountOptions;
  };

  boot.initrd.luks.devices."luks_data3".device = "/dev/disk/by-uuid/d95edc8f-2d5e-4c5e-b4ce-d4ca39d0eb1a";

  fileSystems."/data3" = {
    device = "/dev/disk/by-uuid/7f93f0ef-79e0-4099-84ce-979217f103c3";
    fsType = "btrfs";
    options = defaultMountOptions;
  };

  boot.initrd.luks.devices."luks_games-ssd".device = "/dev/disk/by-uuid/3ee2c64a-5397-487d-8571-24a56d0f09f3";

  fileSystems."/games-ssd" = {
    device = "/dev/disk/by-uuid/a208d799-3eec-4160-888e-631d9850f794";
    fsType = "btrfs";
    options = ["subvol=games-ssd" "ssd" "discard=async"] ++ defaultMountOptions;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/db033cfc-9a7f-442c-8701-dd8b2ceba5c4";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/51E0-EF0E";
    fsType = "vfat";
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/28691f52-a981-49cc-895c-966f4865743e";
    fsType = "btrfs";
    options = ["subvol=swap"] ++ defaultMountOptions;
  };

  # fileSystems."/games" = {
  #   device = "/dev/disk/by-uuid/28691f52-a981-49cc-895c-966f4865743e";
  #   fsType = "btrfs";
  #   options = ["subvol=games" "compress=zstd" "autodefrag"];
  # };

  swapDevices = [
    {
      # size = 20 * 1024;
      device = "/swap/swapfile";
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
