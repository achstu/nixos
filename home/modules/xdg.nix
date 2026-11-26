{ pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = false;

    download = "$HOME/downloads";

    # desktop = "$HOME";
    # documents = "$HOME";
    # music = "$HOME";
    # pictures = "$HOME";
    # projects = "$HOME";
    # publicShare = "$HOME";
    # templates = "$HOME";
    # videos = "$HOME";

    extraConfig = {
      SCREENSHOTS = "$HOME/screenshots";
    };
  };
}
