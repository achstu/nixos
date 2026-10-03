# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/bash.nix
    ./modules/fonts.nix
    ./modules/timers.nix

    ./modules/gnome.nix
    ./modules/apps.nix
    ./modules/printing.nix
    ./modules/devtools.nix
    ./modules/ai.nix
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

    kernelParams = [
      # TODO remove i915
      "i915.enable_dc=0"
      "i915.enable_fbc=0"
      "i915.enable_sagv=0"
      # 1 - ok
      # 2 - ?
      # 3 - ?
      # 4 - ?
      # 5 - tearing
      "intel_idle.max_cstate=4"
    ];
  };

  networking = {
    hostName = "latitude7480";
    networkmanager = {
      # plugins = with pkgs; [ networkmanager-l2tp ];
      enable = true;
    };
  };

  time.timeZone = "Europe/Warsaw";

  users.users.achstu = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "dialout" # or "uucp"
    ];
  };

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  hardware = {
    bluetooth.enable = true;
    enableRedistributableFirmware = true;

    # hardware acceleration of video decoding
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
      # slows every nix command
      # auto-optimise-store = true;
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
    (import ./scripts/mvd.nix { inherit pkgs; })
    # essential dev tools
    zip
    unzip
    p7zip
    helix
    git
    git-lfs
    delta
    tree
    file
    nil # nix lsp

    # audio
    x264
    x265
  ];

  system.stateVersion = "25.05";
}
