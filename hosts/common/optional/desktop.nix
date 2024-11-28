{
  pkgs,
  lib,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  specialisation."linux-xanmod" = {
    inheritParentConfig = true;
    configuration = {
      boot.loader.grub.configurationName = "linux-xanmod-stable";
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_stable;
    };
  };

  specialisation."linux-latest-patched" = {
    inheritParentConfig = true;
    configuration = {
      boot.loader.grub.configurationName = "linux-latest-patched";
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      boot.kernelPatches = [
        {
          name = "drm-amdgpu-fix";
          patch = builtins.fetchurl {
            url = "https://gitlab.freedesktop.org/-/project/4522/uploads/ce146c4a85e9b9f7e4b3c81f3b3be492/v2-0001-drm-amdgpu-Fix-UVD-contiguous-CS-mapping-problem.patch";
            sha256 = "1b6pkji0q0ybk4xy9h3z5lvh74vp5la0x78cisqbn9gicd8w69lj";
          };
        }
      ];
    };
  };
  specialisation."linux-xanmod-patched" = {
    inheritParentConfig = true;
    configuration = {
      boot.loader.grub.configurationName = "linux-xanmod-patched";
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_stable;
      boot.kernelPatches = [
        {
          name = "drm-amdgpu-fix";
          patch = builtins.fetchurl {
            url = "https://gitlab.freedesktop.org/-/project/4522/uploads/ce146c4a85e9b9f7e4b3c81f3b3be492/v2-0001-drm-amdgpu-Fix-UVD-contiguous-CS-mapping-problem.patch";
            sha256 = "1b6pkji0q0ybk4xy9h3z5lvh74vp5la0x78cisqbn9gicd8w69lj";
          };
        }
      ];
    };
  };

  # The amdpgu drivers work with this kernel
  specialisation."linux-6.6" = {
    inheritParentConfig = true;
    configuration = {
      boot.loader.grub.configurationName = "linux-6.6";
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_6_6;
    };
  };

  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;

  boot.kernel.sysctl."kernel.sysrq" = 1;

  time.timeZone = "Europe/Berlin";

  networking.firewall.enable = lib.mkDefault false;
}
