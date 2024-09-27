{pkgs, ...}: {
  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
    askPassword = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
    agentTimeout = "1h";
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };
}
