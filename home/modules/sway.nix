{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps

    extraConfig = ''
      default_border none
      default_floating_border none
    '';

    config = rec { # rec??
      modifier = "Mod4";

      terminal = "kitty";

      startup = [
        # Launch Firefox on start
        { command = "firefox"; }
      ];


      input."type:keyboard" = {
        xkb_layout = "pl";
        xkb_variant = "";
      };

      input."type:touchpad" = {
        tap = "enabled";
        tap_button_map = "lrm";
        natural_scrolling = "disabled";
      };


      keybindings = {
        # window management
        "Mod4+w" = "kill";

        # launch apps
        "Mod4+e" = "exec ${pkgs.firefox}/bin/firefox";
        "Mod4+Return" = "exec ${pkgs.kitty}/bin/kitty";

        # workspaces 1-5
        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";

        # move focused window to a workspace
        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
      };
    };
  };
}
