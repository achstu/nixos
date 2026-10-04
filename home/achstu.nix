{
  config,
  pkgs,
  ...
}:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users."achstu" = {
    # The home.stateVersion option does not have a default and must be set
    home.stateVersion = "26.05";
    # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];

    nixpkgs.config.allowUnfree = true;

    imports = [
      ./modules/bash.nix
      ./modules/fonts.nix
      # ./modules/timers.nix # TODO better backup approach
      # ./modules/gnome.nix
      ./modules/apps.nix
      # ./modules/printing.nix
      ./modules/devtools.nix
      ./modules/ai.nix
      # ./modules/sound.nix # TODO sound -> audio
    ];

    home.packages = with pkgs; [
      (import ./scripts/mvd.nix { inherit pkgs; })
    ];
  };
}
