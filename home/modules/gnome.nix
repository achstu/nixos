{ pkgs, ... }:

let
  wallpaper = ../../assets/deepsky_2560x1440.jpg;
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaper}";
      picture-uri-dark = "file://${wallpaper}";
      picture-options = "zoom";
    };
    "org/gnome/gnome-screenshot" = {
      auto-save-directory = "file:///home/achstu/screenshots";
    };
    "org/gnome/shell/keybindings" = { };
  };

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
}
