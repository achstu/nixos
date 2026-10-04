{ pkgs, ... }:

{
  systemd.timers."rsync-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      # OnCalendar = "weekly";
      Persistent = true;
      Unit = "rsync-backup.service";
    };
  };

  # TODO create better backup system
  systemd.services."rsync-backup" = {
    script = ''
      set -eu
      ${pkgs.rsync}/bin/rsync -av --delete /home/achstu/data /backup
    '';
    serviceConfig = {
      Type = "oneshot";
      # User = "achstu";
      User = "root";
    };
  };
}
