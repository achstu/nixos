{
  config,
  lib,
  pkgs,
  ...
}:

{
  # for obsidian
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # typst (latex replacement)
    zathura
    typst
    typstyle
    # typstfmt
    typst-live
    tinymist
    # typstwriter
    #
    # bibtex still used in typst pipeline
    bibtex-tidy
    texlab

    # slides from markdown
    marp-cli

    # file manager
    yazi
    chafa

    # desktop apps
    # firefox
    kitty
    obsidian
    inkscape
    # xfce.thunar
    vscode-fhs
    xdg-utils # needed by vscode
    vlc
    simplex-chat-desktop

    # cli tools
    yt-dlp
    # python313Packages.yt-dlp-ejs
    ffmpeg
    transmission_4 # for torrent
    # localsend

    qgis # or "qgis-ltr" for long-term-release
    stellarium
    # celestia
    #
    # mission-center
    #

    # bitwarden-desktop
  ];

  environment.sessionVariables = {
    XDG_DATA_DIRS = lib.mkBefore [
      # Make gtk+3 GSettings schema (org.gtk.Settings.FileChooser) visible.
      # Without it, GLib aborts when Qt6 apps (e.g. QGIS) open the GTK3
      # file-chooser save dialog → crash on "Save project".
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    ];
  };
}
