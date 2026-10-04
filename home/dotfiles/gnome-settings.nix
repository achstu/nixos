# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/github/maoschanz/drawing" = {
      last-active-tool = "pencil";
      last-version = "1.0.2";
      maximized = true;
    };

    "com/github/maoschanz/drawing/tools-options" = {
      last-active-shape = "polygon";
      last-delete-replace = "alpha";
      last-font-name = "Sans";
      last-left-rgba = [ "0.8" "0.0" "0.0" "1.0" ];
      last-right-rgba = [ "1.0" "1.0" "0.0" "0.5" ];
      last-shape-filling = "empty";
      last-size = 20;
      last-text-background = "thin-outline";
      use-antialiasing = true;
    };

    "io/github/seadve/Kooha" = {
      capture-mode = "monitor-window";
      record-mic = true;
      screencast-restore-token = "";
      show-pointer = true;
    };

    "io/missioncenter/MissionCenter" = {
      apps-page-column-order = "";
      apps-page-sorting-column-name = "";
      apps-page-sorting-order = "Ascending";
      is-maximized = true;
      performance-selected-page = "memory";
      services-page-column-order = "";
      services-page-sorting-column-name = "";
      services-page-sorting-order = "Ascending";
      window-height = 400;
      window-selected-page = "performance-page";
      window-width = 600;
    };

    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [ 652 480 ];
    };

    "org/gnome/Geary" = {
      migrated-config = true;
    };

    "org/gnome/Snapshot" = {
      is-maximized = false;
      last-camera-id = "Live! Cam Sync 1080p (V4L2)";
      play-shutter-sound = true;
      show-composition-guidelines = false;
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [ 646 600 ];
    };

    "org/gnome/control-center" = {
      last-panel = "sound";
      window-state = mkTuple [ 980 726 false ];
    };

    "org/gnome/desktop/a11y/magnifier" = {
      cross-hairs-length = 58;
      mag-factor = 1.0;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/achstu/.local/share/backgrounds/2026-08-19-21-46-07-simple-space-wallpaper-2560x1440-deep-space-night-sky-26295.jpg";
      picture-uri-dark = "file:///home/achstu/.local/share/backgrounds/2026-08-19-21-46-07-simple-space-wallpaper-2560x1440-deep-space-night-sky-26295.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "pl" ]) (mkTuple [ "xkb" "us" ]) ];
      sources = [ (mkTuple [ "xkb" "pl" ]) (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-blink = true;
      cursor-blink-time = 1200;
      enable-hot-corners = false;
      font-name = "Sans 10";
      gtk-key-theme = "";
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "kitty" "gnome-power-panel" "firefox" "code" "gnome-about-panel" "org-gnome-shell-extensions-gsconnect" ];
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-about-panel" = {
      application-id = "gnome-about-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/kitty" = {
      application-id = "kitty.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      double-click = 400;
      drag-threshold = 8;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/achstu/.local/share/backgrounds/2026-08-19-21-46-07-simple-space-wallpaper-2560x1440-deep-space-night-sky-26295.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      input-feedback-sounds = false;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>w" ];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "lower";
      button-layout = "icon,menu:minimize,maximize,close";
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-size = mkTuple [ 1024 768 ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/font-manager" = {
      compare-background-color = "rgb(255,255,255)";
      compare-foreground-color = "rgb(0,0,0)";
      compare-list = [];
      content-pane-position = 575;
      google-fonts-background-color = "rgb(255,255,255)";
      google-fonts-foreground-color = "rgb(0,0,0)";
      is-maximized = true;
      language-filter-list = [];
      selected-category = "0";
      selected-font = "18";
      window-position = mkTuple [ (-1) (-1) ];
      window-size = mkTuple [ 900 600 ];
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "resources";
      show-dependencies = false;
      show-whose-processes = "user";
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Super>Left" ];
      toggle-tiled-right = [ "<Super>Right" ];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      initial-size-file-chooser = mkTuple [ 890 586 ];
      maximized = true;
    };

    "org/gnome/nm-applet/eap/044ca9b6-619e-4664-9b15-d287ae14e4b2" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/2a8ccd19-02c6-4ab4-93ab-604bbb37cc55" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/d2efa6bf-3000-4864-ad46-2d3c6f784c23" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/portal/filechooser/firefox" = {
      last-folder-path = "/home/achstu/data/misc/harc/podcast/mp3";
    };

    "org/gnome/portal/filechooser/org/chromium/Chromium" = {
      last-folder-path = "/home/achstu/data/dev/gis";
    };

    "org/gnome/portal/filechooser/org/gnome/Nautilus" = {
      last-folder-path = "/home/achstu/downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/Settings" = {
      last-folder-path = "/home/achstu/downloads";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
      night-light-schedule-automatic = false;
      night-light-temperature = mkUint32 3508;
    };

    "org/gnome/settings-daemon/plugins/housekeeping" = {
      donation-reminder-last-shown = mkInt64 1787170457651391;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      help = [];
      screensaver = [ "<Super>Escape" ];
      www = [ "<Super>e" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Launch Terminal";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "gsconnect@andyholmes.github.io" ];
      favorite-apps = [ "firefox.desktop" "code.desktop" "kitty.desktop" "obsidian.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "46.2";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "641708e8125d42d69fa633c2a439738b" ];
      enabled = false;
      missing-openssl = false;
      name = "latitude7480";
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.0 0.3137254901960784 1.0 1.0 ]) (mkTuple [ 0.8 0.0 0.0 1.0 ]) (mkTuple [ 1.0 1.0 0.0 0.5 ]) ];
      selected-color = mkTuple [ true 0.0 0.3137254901960784 1.0 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 156;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 845 1004 ];
    };

  };
}
