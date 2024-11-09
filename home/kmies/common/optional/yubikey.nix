{pkgs, ...}: {
  home.packages = with pkgs; [
    yubikey-touch-detector
    yubikey-manager-qt
    yubikey-manager
    yubikey-agent
    yubikey-personalization
    yubikey-personalization-gui
    yubioath-flutter
    age-plugin-yubikey
    yubico-piv-tool
  ];

  systemd.user.services.yubikey-touch-detector = {
    Unit.After = ["graphical-session.target"];
    Service = {
      ExecStart = "${pkgs.yubikey-touch-detector}/bin/yubikey-touch-detector -libnotify";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
