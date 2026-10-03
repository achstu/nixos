# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    
    ./modules/bash.nix
    ./modules/fonts.nix
    ./modules/timers.nix

    ./modules/gnome.nix
    ./modules/apps.nix
    ./modules/printing.nix
    ./modules/devtools.nix
    ./modules/ai.nix

    ./modules/sound.nix
    ];

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

    initrd.luks.devices."luks-b8875f0e-5bb3-49ee-8665-fd5913ab7d85".device = "/dev/disk/by-uuid/b8875f0e-5bb3-49ee-8665-fd5913ab7d85";
    
    kernelParams = [
      # TODO remove i915
      # "i915.enable_dc=0"
      # "i915.enable_fbc=0"
      # "i915.enable_sagv=0"
      # 1 - ok
      # 2 - ?
      # 3 - ?
      # 4 - ?
      # 5 - tearing
      # "intel_idle.max_cstate=4"
    ];
  };

  networking = {
    hostName = "latitude7480";
    networkmanager = {
      # plugins = with pkgs; [ networkmanager-l2tp ];
      enable = true;
    };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

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

  # Enable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  # console.keyMap = "pl2";

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
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

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
