{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
  ];

  sops.secrets.kmies-password.neededForUsers = true;
  users.mutableUsers = false;

  users.users.kmies = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.kmies-password.path;
    shell = pkgs.xonsh;
    extraGroups = [
      "libvirtd"
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
    ];
    home = "/home/kmies";
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/id_kmies.pub)
      (builtins.readFile ./keys/id_galaxy_droid.pub)
      (builtins.readFile ./keys/id_yubi_one.pub)
      (builtins.readFile ./keys/id_yubi_two.pub)
    ];

    packages = [
      pkgs.home-manager
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.kmies = import ../../../../home/kmies/${config.networking.hostName}.nix;
  };
}
