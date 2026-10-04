{ pkgs, ... }:

let
  wallpaper = ./deepsky_2560x1440.jpg;
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaper}";
      picture-uri-dark = "file://${wallpaper}";
      picture-options = "zoom";
    };
  };
}
