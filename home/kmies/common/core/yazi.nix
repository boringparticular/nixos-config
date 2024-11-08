{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.stable.yazi;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}
