{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./bat.nix
    ./boringvim.nix
    ./bottom.nix
    ./btop.nix
    ./carapace.nix
    ./command-not-found.nix
    ./direnv.nix
    ./fish.nix
    ./fzf.nix
    ./starship.nix
    ./theme.nix
    ./tmux.nix
    ./xonsh
    ./xremap.nix
    ./yazi.nix
    ./zellij.nix
    ./zsh
  ];

  home.packages = with pkgs; [
  ];

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
  };
}
