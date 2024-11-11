{pkgs, ...}: {
  home.packages = with pkgs; [
    xonsh
  ];

  # TODO: set environment variables through a module for all shells
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
      $XONSH_AUTOPAIR = False
      $VI_MODE = True
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

      from xonsh.tools import register_custom_style

      # Catppuccin Mocha Colors
      ROSEWATER = "#f5e0dc"
      FLAMINGO = "#f2cdcd"
      PINK = "#f5c2e7"
      MAUVE = "#cba6f7"
      RED = "#f38ba8"
      MAROON = "#eba0ac"
      PEACH = "#fab387"
      YELLOW = "#f9e2af"
      GREEN = "#a6e3a1"
      TEAL = "#94e2d5"
      SKY = "#89dceb"
      SAPPHIRE = "#74c7ec"
      BLUE = "#89b4fa"
      LAVENDER = "#b4befe"
      TEXT = "#cdd6f4"
      SUBTEXT1 = "#bac2de"
      SUBTEXT0 = "#a6adc8"
      OVERLAY2 = "#9399b2"
      OVERLAY1 = "#7f849c"
      OVERLAY0 = "#6c7086"
      SURFACE2 = "#585b70"
      SURFACE1 = "#45475a"
      SURFACE0 = "#313244"
      BASE = "#1e1e2e"
      MANTLE = "#181825"
      CRUST = "#11111b"

      CYAN = TEAL
      BLACK = CRUST
      PURPLE = MAUVE
      WHITE = TEXT

      BOLD_RED = f'bold {RED}'
      BOLD_BLUE = f'bold {BLUE}'
      BOLD_CYAN = f'bold {CYAN}'
      BOLD_GREEN = f'bold {GREEN}'
      BOLD_PURPLE = f'bold {PURPLE}'
      BOLD_YELLOW = f'bold {YELLOW}'
      BOLD_WHITE = f'bold {WHITE}'

      INTENSE_BLACK = BLACK
      INTENSE_BLUE = BLUE
      INTENSE_CYAN = CYAN
      INTENSE_GREEN = GREEN
      INTENSE_PURPLE = PURPLE
      INTENSE_RED = RED
      INTENSE_WHITE = WHITE
      INTENSE_YELLOW = YELLOW

      BACKGROUND_BLACK = BASE

      XONSH_COLOR_STYLE = {
        'RED': RED,
        'BLUE': BLUE,
        'CYAN': CYAN,
        'BLACK': BLACK,
        'GREEN': GREEN,
        'PURPLE': PURPLE,
        'WHITE': WHITE,
        'YELLOW': YELLOW,

        'BOLD_BLUE': BOLD_BLUE,
        'BOLD_CYAN': BOLD_CYAN,
        'BOLD_GREEN': BOLD_GREEN,
        'BOLD_PURPLE': BOLD_PURPLE,
        'BOLD_RED': BOLD_RED,
        'BOLD_YELLOW': BOLD_YELLOW,

        'INTENSE_BLACK': INTENSE_BLACK,
        'INTENSE_BLUE': INTENSE_BLUE,
        'INTENSE_CYAN': INTENSE_CYAN,
        'INTENSE_GREEN': INTENSE_GREEN,
        'INTENSE_PURPLE': INTENSE_PURPLE,
        'INTENSE_RED': INTENSE_RED,
        'INTENSE_WHITE': INTENSE_WHITE,
        'INTENSE_YELLOW': INTENSE_YELLOW,

        'BACKGROUND_BLACK': BACKGROUND_BLACK,

        'Token.Name': WHITE,
        'Token.Text': WHITE,
        'Token.Error': RED,
        'Token.Other': WHITE,
        'Token.Escape': WHITE,
        # Grey?
        'Token.Comment': WHITE,
        'Token.Generic': WHITE,
        'Token.Keyword': CYAN,
        'Token.Literal': INTENSE_PURPLE,
        'Token.Name.Tag': RED,
        'Token.Operator': RED,
        'Token.Name.Class': INTENSE_GREEN,
        'Token.Name.Label': WHITE,
        'Token.Name.Other': INTENSE_GREEN,
        'Token.Name.Entity': WHITE,
        'Token.Punctuation': WHITE,
        'Token.Generic.Emph': WHITE,
        'Token.Keyword.Type': CYAN,
        'Token.Literal.Date': YELLOW,
        'Token.Name.Builtin': WHITE,
        # Darker grey?
        'Token.PTK.Aborting': OVERLAY2,
        'Token.Generic.Error': WHITE,
        'Token.Name.Constant': CYAN,
        'Token.Name.Function': INTENSE_GREEN,
        'Token.Name.Property': WHITE,
        'Token.Name.Variable': WHITE,
        'Token.Operator.Word': RED,
        # grey ?
        'Token.Comment.Single': SURFACE2,
        'Token.Generic.Output': CYAN,
        'Token.Generic.Prompt': BOLD_RED,
        'Token.Generic.Strong': BOLD_WHITE,
        'Token.Keyword.Pseudo': CYAN,
        'Token.Literal.Number': PURPLE,
        'Token.Literal.String': YELLOW,
        'Token.Name.Attribute': INTENSE_GREEN,
        'Token.Name.Decorator': GREEN,
        'Token.Name.Exception': INTENSE_GREEN,
        'Token.Name.Namespace': WHITE,
        # grey?
        'Token.Comment.Preproc': SURFACE2,
        'Token.Comment.Special': SURFACE2,
        'Token.Generic.Deleted': RED,
        'Token.Generic.Heading': WHITE,
        'Token.Generic.Whitespace': WHITE,
        # grey?
        'Token.Comment.Hashbang': SURFACE2,
        'Token.Generic.Inserted': GREEN,
        'Token.Keyword.Constant': CYAN,
        'Token.Keyword.Reserved': CYAN,
        # grey?
        'TOKEN.Comment.Multiline': SURFACE2,
        'Token.Generic.Traceback': WHITE,
        'Token.Keyword.Namespace': RED,
        'Token.Generic.EmphStrong': BOLD_WHITE,
        'Token.Comment.Subheading': SURFACE2,
        'Token.Literal.Number.Bin': INTENSE_PURPLE,
        'Token.Literal.Number.Hex': INTENSE_PURPLE,
        'Token.Literal.Number.Oct': INTENSE_PURPLE,
        'Token.Literal.String.Doc': INTENSE_YELLOW,
        'Token.PTK.Autosuggestion': SURFACE2,
        'Token.PTK.CompletionMenu': SURFACE2,
        'Token.Punctuation.Marker': WHITE,
        'Token.Comment.PreprocFile': SURFACE2,
        'Token.Keyword.Declaration': CYAN,
        'Token.Literal.String.Char': INTENSE_YELLOW,
        'Token.Name.Builtin.Pseudo': WHITE,
        'Token.Name.Function.Magic': INTENSE_GREEN,
        'Token.Generic.Subheading': SURFACE2,
        'Token.Name.Variable.Class': WHITE,
        'Token.Name.Variable.Magic': WHITE,
        'Token.PTK.Scrollbar.Arrow': SURFACE0,
        'Token.Literal.Number.Float': INTENSE_PURPLE,
        'Token.Literal.String.Affix': INTENSE_YELLOW,
        'Token.Literal.String.Other': INTENSE_YELLOW,
        'Token.Literal.String.Regex': INTENSE_YELLOW,
        'Token.Name.Variable.Global': WHITE,
        'Token.PTK.Scrollbar.Button': SURFACE1,
        'Token.Literal.String.Double': INTENSE_YELLOW,
        'Token.Literal.String.Escape': INTENSE_PURPLE,
        'Token.Literal.String.Single': INTENSE_YELLOW,
        'Token.Literal.String.Symbol': INTENSE_YELLOW,
        'Token.Literal.Number.Integer': INTENSE_PURPLE,
        'Token.Name.Variable.Instance': WHITE,
        'Token.Literal.String.Heredoc': INTENSE_YELLOW,
        'Token.Literal.String.Backtick': INTENSE_YELLOW,
        'Token.Literal.String.Interpol': INTENSE_YELLOW,
        'Token.Literal.String.Delimiter': INTENSE_YELLOW,
        'Token.PTK.Scrollbar.Background': OVERLAY0,
        'Token.Literal.Number.Integer.Long': INTENSE_PURPLE,
        'Token.PTK.CompletionMenu.Completion': OVERLAY0,
        'Token.PTK.CompletionMenu.Completion.Current': OVERLAY0,
      }

      register_custom_style('catppuccin-mocha', XONSH_COLOR_STYLE)
      $XONSH_COLOR_STYLE = 'catppuccin-mocha'

      xontrib load abbrevs
      xontrib load fish_completer
      xontrib load direnv
      xontrib load zoxide

      abbrevs['gia'] = 'git add'
      abbrevs['gp'] = 'git push'
      abbrevs['gR'] = 'git remote'

      abbrevs['gl'] = 'git log --topo-order --pretty=format:"$_git_log_medium_format"'
      abbrevs['gls'] = 'git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
      abbrevs['gld'] = 'git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
      abbrevs['glo'] = 'git log --topo-order --pretty=format:"$_git_log_oneline_format"'
      abbrevs['glg'] = 'git log --topo-order --graph --pretty=format:"$_git_log_oneline_format"'
      abbrevs['glb'] = 'git log --topo-order --pretty=format:"$_git_log_brief_format"'
      abbrevs['glc'] = 'git shortlog --summary --numbered'
      abbrevs['glS'] = 'git log --show-signature'

      aliases['rm'] = 'rm -i'
      aliases['cp'] = 'cp -i'
      aliases['mv'] = 'mv -i'
      aliases['cat'] = 'bat --paging=never'
      aliases['ls'] = 'eza'
      aliases['l'] = 'eza -l --all --group-directories-first --git'
      aliases['ll'] = 'eza -l --all --all --group-directories-first --git'
      aliases['lt'] = 'eza -T --git-ignore --level=2 --group-directories-first'
      aliases['llt'] = 'eza -lT --git-ignore --level=2 --group-directories-first'
      aliases['lT'] = 'eza -T --git-ignore --level=4 --group-directories-first'
      aliases['grep'] = 'rg'
      aliases['top'] = 'btm'
      aliases['dd'] = 'dd status=progress'

      aliases['athena'] = 'ssh kmies@athena.edgecube.io'
      aliases['hermes'] = 'ssh kmies@hermes.edgecube.io'
      aliases['demeter'] = 'ssh kmies@192.168.15.23'

      aliases['nnvim'] = 'nix run "github:boringparticular/nixCats" -- '

      source-bash /home/kmies/.guix-profile/etc/profile
      $GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"

      execx($(/etc/profiles/per-user/kmies/bin/starship init xonsh --print-full-init))
      exec($(carapace _carapace xonsh))
      execx($(atuin init xonsh))

    '';
}
