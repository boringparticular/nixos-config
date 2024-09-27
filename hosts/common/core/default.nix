{...}: {
  imports = [
    ./fish.nix
    ./fonts.nix
    ./git.nix
    ./locals.nix
    ./network.nix
    ./nh.nix
    ./nix.nix
    ./packages.nix
    ./sops.nix
    ./ssh.nix
    ./xonsh.nix
    ./zsh.nix
  ];

  system.stateVersion = "24.05";
}
