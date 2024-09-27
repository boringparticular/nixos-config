{pkgs, ...}: {
  imports = [
    # ./passthrough.nix
  ];

  boot.initrd.availableKernelModules = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = ["radeon.cik_support=0" "amdgpu.cik_support=1"];

  services.xserver.videoDrivers = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # rocm-opencl-icd
      # rocm-opencl-runtime
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # TODO: Move to home packages
  environment.systemPackages = with pkgs; [
    libsForQt5.kdialog
    zenity
    wineWowPackages.unstableFull
    winetricks
    lutris
    mangohud
    protonup-qt
    protonup-ng
    protontricks
    # heroic
    bottles
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode = {
    enable = true;
    settings = {
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };

  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: [pkgs.libgcc];
    };
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true; # Enable gamescope session
  };
}
