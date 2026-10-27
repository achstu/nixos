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

    # ./home/achstu.nix

    # ./system/audio.nix
    # ./system/printing.nix
    # ./system/gnome.nix
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

    initrd.luks.devices."luks-b8875f0e-5bb3-49ee-8665-fd5913ab7d85".device =
      "/dev/disk/by-uuid/b8875f0e-5bb3-49ee-8665-fd5913ab7d85";

    kernelParams = [
      # TODO remove i915
      # "i915.enable_dc=0"
      # "i915.enable_fbc=0"
      # "i915.enable_sagv=0"
      "intel_idle.max_cstate=4" # removes tearing on SAMSUNG monitor
    ];
  };

  # services.immich = {
    # enable = true;
    # port = 2283;
  # };

  networking = {
    hostName = "latitude7480";
    networkmanager = {
      plugins = with pkgs; [
        # networkmanager-l2tp
        networkmanager-openvpn
      ];
      enable = true;
    };
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Set your time zone.
  # time.timeZone = "Europe/Warsaw";
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "pl_PL.UTF-8";
  #   LC_IDENTIFICATION = "pl_PL.UTF-8";
  #   LC_MEASUREMENT = "pl_PL.UTF-8";
  #   LC_MONETARY = "pl_PL.UTF-8";
  #   LC_NAME = "pl_PL.UTF-8";
  #   LC_NUMERIC = "pl_PL.UTF-8";
  #   LC_PAPER = "pl_PL.UTF-8";
  #   LC_TELEPHONE = "pl_PL.UTF-8";
  #   LC_TIME = "pl_PL.UTF-8";
  # };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  # console.keyMap = "pl2";

  users.users."achstu" = {
    isNormalUser = true;
    description = "Michał Stachurski";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "dialout" # or uucp
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  nixpkgs.config.allowUnfree = true;

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

  # nixpkgs.config.allowUnfree = true;
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
    nh
  ];

  # system.copySystemConfiguration = true;
  system.stateVersion = "26.05";
}
