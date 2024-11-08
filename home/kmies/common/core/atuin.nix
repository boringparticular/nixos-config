{
  config,
  pkgs,
  ...
}: {
  systemd.user.services."atuin-daemon" = {
    Unit = {
      Description = "Atuin Daemon";
      After = ["network.target"];
    };
    Service = {
      RestartSec = 2;
      ExecStart = "${config.programs.atuin.package}/bin/atuin daemon";
      Environment = ["ATUIN_LOG=info"];
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };

  programs.atuin = {
    enable = true;
    package = pkgs.unstable.atuin;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    settings = {
      style = "compact";
      auto_sync = true;
      update_check = false;
      sync_frequency = "5m";
      sync_address = "https://atuin.edgecube.io";
      search_mode = "prefix";
      daemon.enabled = true;
      enter_accept = true;
    };
  };
}
