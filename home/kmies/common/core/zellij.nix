{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
  xdg.configFile."zellij/config.kdl".text =
    # kdl
    ''
      default_layout "compact"
      pane_frames false
      simplified_ui true
      theme "catppuccin-mocha"
      keybinds {
          unbind "Ctrl g" "Ctrl h" "Ctrl n" "Ctrl o" "Ctrl p" "Ctrl q" "Ctrl s" "Ctrl t"

          normal {
          }

          locked {
              bind "Alt g" { SwitchToMode "normal"; }
          }

          resize {
              bind "Alt r" { SwitchToMode "normal"; }
          }

          tab {
              bind "Alt t" { SwitchToMode "normal"; }
              bind "Alt h" { MoveTab "Left"; }
              bind "Alt l" { MoveTab "Right"; }
          }

          move {
              bind "Alt m" { SwitchToMode "normal"; }
          }

          session {
              bind "Alt s" { SwitchToMode "normal"; }
          }

          search {
              bind "Alt f" { SwitchToMode "normal"; }
          }

          pane {
              bind "Alt p" { SwitchToMode "normal"; }
          }

          shared_except "locked" {
              bind "Alt q" { Quit; }
              bind "Alt s" { SwitchToMode "session"; }
              bind "Alt t" { SwitchToMode "tab"; }
              bind "Alt f" { SwitchToMode "search"; }
              bind "Alt r" { SwitchToMode "resize"; }
              bind "Alt p" { SwitchToMode "pane"; }
              bind "Alt m" { SwitchToMode "move"; }
              bind "Alt g" { SwitchToMode "locked"; }
          }
      }
    '';
}
