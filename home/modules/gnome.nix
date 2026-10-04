{ pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    nautilus
    bibata-cursors
  ];

  # gsettings get org.gnome.shell enabled-extensions
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # dconf.settings = {
    # "org/gnome/desktop/interface" = {
      # cursor-theme = "Bibata-Modern-Classic";
      # cursor-size = 24;
    # };
  # };

  # xdg.portal = {
  # enable = true;
  # wlr.enable = true;
  # extraPortals = with pkgs; [
  # xdg-desktop-portal-wlr
  # xdg-desktop-portal-gtk
  # ];
  # config = {
  # common.default = [ "gtk" ];
  # };
  # };
}
