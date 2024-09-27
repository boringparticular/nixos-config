{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  networking.firewall.allowedTCPPorts = [22];

  security.pam = {
    sshAgentAuth.enable = true;
    services.sudo.sshAgentAuth = true;
  };
}
