{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # inputs.hardware.nixosModules.common-cpu-intel
    # inputs.hardware.nixosModules.common-gpu-amd
    # inputs.hardware.nixosModules.common-pc-ssd

    ../common/core
    ../common/users/kmies
    ../common/optional/audio.nix
    ../common/optional/catppuccin.nix
    ../common/optional/fcitx.nix
    ../common/optional/flatpak.nix
    ../common/optional/gaming.nix
    ../common/optional/hyprland.nix
    ../common/optional/keyring.nix
    ../common/optional/libvirt.nix
    ../common/optional/podman.nix
    ../common/optional/printer.nix
    ../common/optional/sddm.nix
    ../common/optional/ssh.nix
    ../common/optional/theme.nix
    ../common/optional/thunar.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      # efiInstallAsRemovable = true;
      device = "nodev";
    };
  };

  boot.loader.grub.gfxmodeEfi = "1920x1080";

  boot.kernelParams = ["pcie_aspm=off"];
  boot.binfmt.emulatedSystems = ["armv7l-linux"];

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  # boot.kernelParams = ["quiet"];

  networking.hostName = "zeus";

  services.xserver.videoDrivers = ["intel" "amdgpu"];
}
