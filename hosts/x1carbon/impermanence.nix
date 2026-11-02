# Impermanence: only what is listed here survives a reboot.
# The root filesystem is a tmpfs (see disko.nix); persistent state lives
# under /persist on the encrypted btrfs volume and is bind-mounted back.
{ ... }:

{
  environment.persistence."/persist" = {
    hideMounts = true;

    # System state
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
      "/var/lib/docker"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
    ];

    # Home-directory state (paths relative to /home/achstu)
    users.achstu = {
      directories = [
        # xdg user dirs (see home/achstu.nix -> xdg.userDirs)
        "downloads"
        "screenshots"

        # dotfiles / app data
        ".config"
        ".local/share"
        ".cache"
        ".ssh"
        ".gnupg"
      ];
      files = [
        ".bash_history"
      ];
    };
  };
}