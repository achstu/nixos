{
  config,
  pkgs,
  username,
  ...
}:
{
  # The home.stateVersion option does not have a default and must be set
  home.stateVersion = "26.05";
  # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/bash.nix
    ./modules/fonts.nix
    # ./modules/timers.nix # TODO better backup approach
    ./modules/gnome.nix
    ./modules/apps.nix
    ./modules/devtools.nix
    ./modules/ai.nix

    ./config.nix
  ];

  home.packages = with pkgs; [
    (import ./scripts/mvd.nix { inherit pkgs; })
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    # Przekierowujemy potrzebne katalogi na małe litery
    download = "$HOME/downloads";

    # Wyłączamy/przekierowujemy pozostałe standardowe foldery do $HOME
    desktop = "$HOME";
    documents = "$HOME";
    music = "$HOME";
    pictures = "$HOME";
    projects = "$HOME";
    publicShare = "$HOME";
    templates = "$HOME";
    videos = "$HOME";

    # Dodatkowe własne katalogi
    extraConfig = {
      XDG_SCREENSHOTS_DIR = "$HOME/screenshots";
    };
  };

  dconf.settings = {
    "org/gnome/gnome-screenshot" = {
      auto-save-directory = "file:///home/achstu/screenshots";
    };
    # Dla wbudowanego narzędzia do screenshotów w nowszych wersjach GNOME:
    "org/gnome/shell/keybindings" = { };
  };
}
