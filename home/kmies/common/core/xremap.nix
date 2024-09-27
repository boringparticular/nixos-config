{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  home.packages = [
    inputs.xremap-flake.packages.${pkgs.system}.default
  ];

  services.xremap = {
    withX11 = true;
    debug = true;
    config = {
      modmap = [
        {
          name = "Global";
          remap = {
            "Compose" = "LeftMeta";
            "CapsLock" = {
              held = "LeftCtrl";
              alone = "Esc";
            };
          };
        }
      ];
      keymap = [
      ];
    };
  };
  systemd.user.services.xremap.Service.Environment = lib.mkForce [
    "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/kmies/bin"
  ];
  systemd.user.services.xremap.Service.KillMode = "process";
}
