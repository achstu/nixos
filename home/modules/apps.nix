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

  home.packages = with pkgs; [
    # typst (latex replacement)
    zathura
    onlyoffice-desktopeditors
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

    bitwarden-desktop
    localsend
  ];
}
