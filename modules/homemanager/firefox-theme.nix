{
  config,
  lib,
  pkgs,
  ...
}: let
  # Import sources from npins for original LittleFox theme
  sources = import ../../npins;

  # Get LittleFox theme from npins
  littleFoxTheme = pkgs.fetchFromGitHub {
    owner = "biglavis";
    repo = "LittleFox";
    rev = sources.LittleFox.revision;
    sha256 = sources.LittleFox.hash;
  };

  # Firefox profile path (your existing profile)
  firefoxProfilePath = "${config.home.homeDirectory}/.mozilla/firefox/rktpcgzb.default";
in {
  options.firefox-theme = {
    enable = lib.mkEnableOption "Firefox LittleFox theming";
  };

  config = lib.mkIf config.firefox-theme.enable {
    # Create a custom version of LittleFox with Reversal-Dark colors
    home.file."${firefoxProfilePath}/chrome/userChrome.css" = {
      text = ''
        /*  ,-----. ,-----. ,--.  ,--.,------.,--. ,----.
         * '  .--./'  .-.  '|  ,'.|  ||  .---'|  |'  .-./
         * |  |    |  | |  ||  |' '  ||  `--, |  ||  | .---.
         * '  '--'\'  '-'  '|  | `   ||  |`   |  |'  '--'  |
         *  `-----' `-----' `--'  `--'`--'    `--' `------'
         *
         * LittleFox - Reversal-Dark Edition
         * Original minimalist design with custom color scheme
         */

        :root {
          /* === REVERSAL-DARK COLOR OVERRIDES === */
          --window-bg: #0b0b0b;
          --toolbar-bg: #171717;
          --tab-bg: #242424;
          --tab-active-bg: #0b0b0b;
          --border-color: #2C2C2C;
          --text-color: #FFFFFF;
          --accent-color: #5b9bf8;
          --accent-hover: rgba(91, 155, 248, 0.2);
          --button-hover: #404040;

          /* === ORIGINAL LITTLEFOX CONFIGURATION === */
          /* Show/hide reload button
           * show: flex
           * hide: none
           */
          --show-reload: none;

          /* Navigation toolbar width
           * max width is applied when url bar is expanded
           */
          --navbar-width: max(35vw, 500px);
          --navbar-max-width: max(60vw, 800px);

          /* Dynamic tab width */
          --active-tab-width: clamp(100px, 24vw, 240px);
          --inactive-tab-width: clamp(100px, 18vw, 180px);

          /* Preferred find bar width
           * set to 0px for minimum width
           */
          --findbar-width: calc(var(--findbar-min-width-expanded) + (100vw - 2 * var(--findbar-right) - var(--findbar-min-width-expanded)) * 0.12);

          /* Find bar distance from window corners */
          --findbar-top: 12px;
          --findbar-right: max(2vw, 30px); /* scrollbar is 18px */

          /* Find bar transition duration
           * changes the duration of the find bar open/close transition animation
           */
          --findbar-transition-duration: 100ms;

          /* Find bar transition distance
           * changes how far the find bar travels down/up during the open/close transition animation
           */
          --findbar-transition-distance: 20px;

          /* Show/hide find bar options
           * show: 1
           * hide: 0
           */
          --show-highlight-all:    1;
          --show-match-case:       1;
          --show-match-diacritics: 1;
          --show-whole-words:      1;

          /* Find bar options position */
          --highlight-all-position:    0;
          --match-case-position:       1;
          --match-diacritics-position: 2;
          --whole-words-position:      3;

          /* === INTERNAL VARIABLES (from original LittleFox) === */
          --urlbar-border-radius: 12px;
          --findbar-border-radius: 12px;
          --button-border-radius: 8px;
          --tab-border-radius: 8px;
          --sidebar-border-radius: 0px 8px 8px 0px;
          --panel-border-radius: 12px;
          --arrowpanel-border-radius: 12px;
          --tab-block-margin: 4px;
          --tab-gap: 0px;
          --findbar-min-width: 400px;
          --findbar-min-width-expanded: 520px;
        }

        /* Load original LittleFox CSS with color replacements */
        ${
          builtins.replaceStrings
          [
            /*
            Replace original LittleFox colors with Reversal-Dark
            */
            "--lwt-accent-color: #2b2a33;"
            "--lwt-text-color: #fbfbfe;"
            "--arrowpanel-background: #474649;"
            "--arrowpanel-color: #fbfbfe;"
            "--toolbar-bgcolor: #2b2a33;"
            "--toolbar-color: #fbfbfe;"
            "--toolbarbutton-icon-fill: #fbfbfe;"
            "--toolbarbutton-hover-background: rgba(251, 251, 254, 0.1);"
            "--toolbarbutton-active-background: rgba(251, 251, 254, 0.15);"
            "--tab-selected-bgcolor: #42414d;"
            "--lwt-selected-tab-background-color: #42414d;"
            "--lwt-tab-text: #fbfbfe;"
            "--newtab-background-color: #2b2a33;"
            "--newtab-text-primary-color: #fbfbfe;"
          ]
          [
            /*
            Reversal-Dark replacements
            */
            "--lwt-accent-color: var(--toolbar-bg);"
            "--lwt-text-color: var(--text-color);"
            "--arrowpanel-background: var(--tab-bg);"
            "--arrowpanel-color: var(--text-color);"
            "--toolbar-bgcolor: var(--toolbar-bg);"
            "--toolbar-color: var(--text-color);"
            "--toolbarbutton-icon-fill: var(--text-color);"
            "--toolbarbutton-hover-background: var(--accent-hover);"
            "--toolbarbutton-active-background: var(--accent-color);"
            "--tab-selected-bgcolor: var(--tab-active-bg);"
            "--lwt-selected-tab-background-color: var(--tab-active-bg);"
            "--lwt-tab-text: var(--text-color);"
            "--newtab-background-color: var(--window-bg);"
            "--newtab-text-primary-color: var(--text-color);"
          ]
          (builtins.readFile "${littleFoxTheme}/userChrome.css")
        }

        /* Additional Reversal-Dark color fixes */
        :root {
          --lwt-accent-color: var(--toolbar-bg) !important;
          --lwt-text-color: var(--text-color) !important;
          --toolbar-bgcolor: var(--toolbar-bg) !important;
          --toolbar-color: var(--text-color) !important;
          --toolbarbutton-icon-fill: var(--text-color) !important;
        }

        /* Override any remaining hardcoded colors */
        #main-window {
          background-color: var(--window-bg) !important;
        }

        #navigator-toolbox {
          background-color: var(--toolbar-bg) !important;
          border-bottom: 1px solid var(--border-color) !important;
        }

        .tabbrowser-tab {
          background-color: var(--tab-bg) !important;
        }

        .tabbrowser-tab[selected="true"] {
          background-color: var(--tab-active-bg) !important;
        }

        #urlbar {
          background-color: var(--tab-bg) !important;
          color: var(--text-color) !important;
          border-color: var(--border-color) !important;
        }

        #urlbar:focus-within {
          border-color: var(--accent-color) !important;
        }
      '';
      force = true;
    }; # Ensure chrome directory exists
    home.file."${firefoxProfilePath}/chrome/.keep" = {
      text = "";
    };

    # Create a script to enable CSS support in Firefox
    home.packages = [
      (pkgs.writeShellScriptBin "firefox-enable-css" ''
        echo "Enabling Firefox CSS support..."
        echo "Please set toolkit.legacyUserProfileCustomizations.stylesheets to true in about:config"
        echo "Then restart Firefox to see the LittleFox theme"

        # Try to set it automatically if Firefox is not running
        if ! pgrep firefox > /dev/null; then
          echo "Firefox is not running. Setting preference automatically..."
          PREFS_FILE="${firefoxProfilePath}/prefs.js"

          # Backup existing prefs
          if [ -f "$PREFS_FILE" ]; then
            cp "$PREFS_FILE" "$PREFS_FILE.backup.$(date +%s)"
          fi

                    if grep -q \"toolkit.legacyUserProfileCustomizations.stylesheets\" \"$PREFS_FILE\" 2>/dev/null; then
            sed -i 's/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets",.*/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);/' "$PREFS_FILE"
          else
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PREFS_FILE"
          fi

          echo "CSS support enabled automatically. Start Firefox to see the theme!"
        else
          echo "Firefox is running. Please manually set the preference in about:config"
        fi
      '')
    ];

    # Provide theme information
    home.file."${config.home.homeDirectory}/.config/firefox-theme-info.txt" = {
      text = ''
        LittleFox Firefox Theme - Reversal-Dark Edition
        ==============================================

        Theme Source: https://github.com/biglavis/LittleFox (customized)
        Color Scheme: Reversal-Dark (matches GTK/Qt theming)
        Installed to: ${firefoxProfilePath}/chrome/userChrome.css

        To enable:
        1. Run: firefox-enable-css
        2. Or manually: Go to about:config and set toolkit.legacyUserProfileCustomizations.stylesheets = true
        3. Restart Firefox

        Customization:
        Edit the CSS variables at the top of userChrome.css to customize colors and layout.
        The Reversal-Dark color palette is defined as CSS custom properties.

        Features:
        - Dynamic UI buttons with Reversal-Dark colors
        - Customizable floating find bar
        - Mouse-friendly minimalist design
        - Consistent theming with your GTK/Qt setup
        - Dark theme optimized for your system
      '';
    };
  };
}
