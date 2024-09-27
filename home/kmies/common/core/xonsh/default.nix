{pkgs, ...}: {
  home.packages = with pkgs; [
    xonsh
  ];

  home.file.".xonshrc".text =
    /*
    python
    */
    ''
      $XONSH_SHOW_TRACEBACK = True
      $FLAKE = "/home/kmies/projects/nixos/config"
      $AUTO_CD = True
      $AUTO_PUSHD = True
      $COLOR_RESULTS = True
      $ENABLE_ASYNC_PROMPT = True
      $HISTCONTROL = {'ignorespace', 'erasedups'}
      $XONSH_HISTORY_BACKEND = 'sqlite'
      $XONSH_HISTORY_SIZE = (2**18, 'commands')
      $XONSH_STORE_STDOUT = True
      $XONSH_AUTOPAIR = True
      $VI_MODE = False
      $MOUSE_SUPPORT = False
      $ALIAS_COMPLETIONS_OPTIONS_BY_DEFAULT = True
      $AUTO_SUGGEST = True
      $AUTO_SUGGEST_IN_COMPLETIONS = True
      $CASE_SENSITIVE_COMPLETIONS = False
      $COMPLETION_IN_THREAD = True
      $COMPLETION_MODE = 'default'
      $COMPLETIONS_DISPLAY = 'multi'
      $COMPLETIONS_BRACKETS = True
      $COMPLETIONS_CONFIRM = True
      $UPDATE_COMPLETIONS_ON_KEYPRESS = False
      $CMD_COMPLETIONS_SHOW_DESC = True
      $BASH_COMPLETIONS = '${pkgs.bash-completion}/share/bash-completion/bash_completion'
      $XONSH_COLOR_STYLE = 'monokai'
      # $XONSH_COLOR_STYLE='catppuccin-mocha'

      execx($(/etc/profiles/per-user/kmies/bin/starship init xonsh --print-full-init))
      exec($(carapace _carapace xonsh))
      execx($(atuin init xonsh))

    '';
}
