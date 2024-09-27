{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "b";
    clock24 = true;
    newSession = true;
    keyMode = "vi";
    sensibleOnTop = true;
    baseIndex = 1;
    customPaneNavigationAndResize = false;
    terminal = "screen-256color";
    escapeTime = 0;
    shell = "${pkgs.xonsh}/bin/xonsh";
    tmuxp.enable = true;
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color*:RGB"
    '';
  };
}
