{
  config,
  configVars,
  ...
}: {
  services.borgbackup.jobs.zeus = {
    paths = [
      "/home/kmies/projects"
      "/home/kmies/old-home"
      "/home/kmies/.config/vivaldi"
      "/home/kmies/.local/share/chezmoi"
      "/home/kmies/vault_pass_testing"
      "/home/kmies/data/droid-backup"
      "/etc/nixos"
      "/home/kmies/.gnupg"
      "/home/kmies/data/Backup.kdbx"
    ];
    exclude = [
      "**/.git"
      "**/venv"
      "**/.venv"
      "**/node_modules"
      "/root/.cache"
      "/home/**/.cache"
    ];

    environment.BORG_RSH = "ssh -o 'StrictHostKeyChecking=no' -i ${config.sops.secrets."zeus/backup/ssh_key".path}";
    encryption.passCommand = "cat ${config.sops.secrets."zeus/backup/password".path}";
    encryption.mode = "repokey-blake2";
    archiveBaseName = "${config.networking.hostName}";
    repo = configVars.hosts.zeus.backupRepo;
    startAt = "*-*-* 09,17:00:00";
    prune.keep = {
      daily = 7;
      weekly = 4;
      monthly = 6;
    };
    prune.prefix = "${config.networking.hostName}-";
    persistentTimer = true;
  };
}
