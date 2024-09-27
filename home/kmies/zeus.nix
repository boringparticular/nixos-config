{pkgs, ...}: {
  imports = [
    ./common/core
    ./common/optional/hyprland
    ./common/optional/comm.nix
    ./common/optional/foot.nix
    ./common/optional/gammastep.nix
    ./common/optional/gpg.nix
    ./common/optional/input.nix
    ./common/optional/mako.nix
    ./common/optional/mpv.nix
    ./common/optional/nextcloud.nix
    ./common/optional/printing.nix
    ./common/optional/rofi.nix
    ./common/optional/sops.nix
    ./common/optional/syncthing.nix
    ./common/optional/vlc.nix
    ./common/optional/vscode.nix
    ./common/optional/xdg.nix
    ./common/optional/yubikey.nix
    ./common/optional/zen-browser.nix
  ];

  home = {
    username = "kmies";
    homeDirectory = "/home/kmies";
    stateVersion = "24.05";

    packages = with pkgs; [
      xfce.mousepad

      strawberry
      picard

      floorp
      tor-browser
      librewolf

      qutebrowser
      luakit
      litebrowser
      lynx
      nyxt

      stremio

      imv
      feh

      calibre

      anki-bin

      libreoffice-fresh
      thunderbird

      nix-output-monitor
      nix-init

      unar

      keepassxc

      evince
      zathura
      kdePackages.okular

      blender
      gimp
      inkscape

      zstd
      pv

      nvd

      lazygit
      aspell
      aspellDicts.de
      aspellDicts.en
      hunspell
      hunspellDicts.de_DE
      hunspellDicts.en_US

      wireplumber

      glow
      nurl
      any-nix-shell
      nixd
      alejandra
    ];
  };
}
