# ThinkPad X1 Carbon Gen 8 - main system configuration.
# Disk layout: see ./disko.nix. Persistence: see ./impermanence.nix.
{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./impermanence.nix

    ./system/audio.nix
    ./system/printing.nix
    ./system/gnome.nix
  ];

  boot = {
    kernelModules = [
      "video"
      "acpi_video"
      "bluetooth"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    # Needed so the tmpfs root + /nix + /persist are mounted early.
    initrd.systemd.enable = true;
    supportedFilesystems = [ "btrfs" ];
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  networking = {
    hostName = "x1c8"; # TODO inherit from hostname in flake.nix?
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  time.timeZone = "Pacific/Auckland";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  virtualisation.docker.enable = true;

  users.users."root" = {
    hashedPassword = "$6$tAP/qDc6YbqvvP7B$FfP.GKFMLvrCReNXHDafNCjw/JeF9BmtT5HYUMJgt5k/usAqEwgc9oW1llGrWHoHlEBu6LXzXUALpMa1haVA11";
  };

  users.users."achstu" = {
    isNormalUser = true;
    description = "Michał Stachurski";
    hashedPassword = "$6$lAXRgVkOF0wjiFrw$0FDdpUKng9R/6.a3jF7UB7fVRxP95biB0dEfn1CZNBTgBPS.UPdnkJqKxgBYqG/cVvq8WOdDAfk3IvBL7jPPT/";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "dialout"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  hardware = {
    bluetooth.enable = true;
    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      extraPackages = [
        pkgs.intel-media-driver
        pkgs.intel-vaapi-driver
      ];
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    zip unzip p7zip
    
    helix

    git git-lfs jujutsu
    
    delta
    tree
    file
    nil
    nh
    agenix-cli
  ];

  services = {
    thermald.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
  };

  system.stateVersion = "26.05";
}
