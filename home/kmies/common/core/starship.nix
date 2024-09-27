{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$os"
        "$directory"
        "$sudo"
        "$git_branch"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$shell"
        "$fill"
        "$status "
        "$memory_usage"
        "$cmd_duration"
        "$jobs"
        "$direnv"
        "$golang"
        "$lua"
        "$python"
        "$rust"
        "$container"
        "$username"
        "$hostname"
        "$nix_shell"
        "$time"
        "$line_break"
        "$character"
      ];

      add_newline = true;

      fill.symbol = "─";

      memory_usage.disabled = false;
      shell.disabled = true;
      sudo.disabled = false;

      directory = {
        truncation_length = 10;
        truncate_to_repo = false;
        format = "[ $path]($style)[$read_only]($read_only_style) ";
        style = "blue";
        repo_root_style = "bold blue";
        before_repo_root_style = "blue";
      };

      git_branch = {
        format = "[$symbol $branch(:$remote_branch)]($style) ";
        style = "green";
        symbol = "";
      };
      git_status = {
        format = "([$modified](yellow) [$untracked](blue) )";
        ahead = "a\${count}";
        behind = "b\${count}";
        stashed = "s\${count}";
        modified = "!\${count}";
        conflicted = "c\${count}";
        staged = "st\${count}";
        deleted = "d\${count}";
        renamed = "r\${count}";
        untracked = "?\${count}";
      };

      nix_shell = {
        format = "[$symbol$state]($style) ";
        # symbol = "❄️ ";
        symbol = " ";
        style = "sapphire";
      };

      status = {
        disabled = false;
        format = "[$symbol $status]($style)";
        symbol = "✘";
      };

      os = {
        disabled = false;
        symbols.NixOS = " ";
      };

      cmd_duration = {
        format = "[ $duration]($style) ";
        style = "green";
      };

      time = {
        disabled = false;
        format = "[ $time]($style)";
        style = "dimmed sky";
      };
    };
  };
}
