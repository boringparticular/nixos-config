{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    nixd

    nix
    home-manager
    git
    just

    age
    ssh-to-age
    sops
  ];
}
