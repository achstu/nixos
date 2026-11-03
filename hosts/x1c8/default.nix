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

  # Agenix: passwords are stored encrypted in the repo (secrets/*.age) and
  # decrypted at boot to /run/agenix. The age private key lives on /persist.
  age.identityPaths = [ "/persist/etc/agenix-key" ];
  age.secrets = {
    achstu-password.file = ../../secrets/achstu-password.age;
    root-password.file = ../../secrets/root-password.age;
  };

  users.users."root" = {
    hashedPasswordFile = config.age.secrets.root-password.path;
  };

  users.users."achstu" = {
    isNormalUser = true;
    description = "Michał Stachurski";
    hashedPasswordFile = config.age.secrets.achstu-password.path;
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
    agenix
  ];

  system.stateVersion = "26.05";
}