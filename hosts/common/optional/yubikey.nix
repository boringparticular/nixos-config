{pkgs, ...}: {
  security.pam.services = {
    gnome-keyring.u2fAuth = true;
    login.u2fAuth = true;
    sudo = {
      u2fAuth = true;
    };
    sddm.u2fAuth = true;
    gdm.u2fAuth = true;
  };

  security.pam.u2f = {
    enable = true;
    cue = true;
    control = "sufficient";
  };

  services.udev.packages = [pkgs.yubikey-personalization pkgs.libu2f-host];
  services.yubikey-agent.enable = false;
  services.pcscd.enable = true;

  security.polkit = {
    enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["kmies"];
  users.groups.input.members = ["kmies"];
}
