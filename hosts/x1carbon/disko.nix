# Declarative disk layout for the X1 Carbon.
#
# Run the formatter before first install:
#   sudo disko --mode create,Mount --flake .#laptop
# then:
#   sudo nixos-install --flake .#laptop --no-root-passwd
#
# Layout:
#   /dev/nvme0n1p1  ESP      vfat    /boot   (1G, unencrypted, systemd-boot)
#   /dev/nvme0n1p2  LUKS     -> btrfs
#                              subvol @nix     -> /nix
#                              subvol @persist -> /persist
#   /              tmpfs     (ephemeral root, wiped on every boot)
{
  ...
}:
{
  # tmpfs root needs /nix mounted in the initrd, and impermanence requires
  # /persist to be mounted before the persistence bind-mounts run.
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/persist".neededForBoot = true;

  disko.devices = {
    # Ephemeral root: nothing here survives a reboot unless bind-mounted
    # from /persist by the impermanence module.
    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [ "size=8G" "mode=755" ];
    };

    disk.main = {
      type = "disk";
      # TODO: verify on the target machine (lsblk). X1 Carbon Gen 8 uses NVMe.
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          esp = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          luks = {
            size = "100%";
            content = {
              type = "luks";
              name = "crypted";
              # Prompted for during `disko` format and on every boot.
              settings.allowDiscards = true;
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}