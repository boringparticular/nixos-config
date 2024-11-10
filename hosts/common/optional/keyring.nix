{
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    gdm.enableGnomeKeyring = true;
    sddm.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
}
