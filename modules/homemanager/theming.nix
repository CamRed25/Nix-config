# Home-manager theming configuration
# GTK, Qt, and Firefox theming
{pkgs, ...}: {
  # Import Firefox theme module
  imports = [
    ./firefox-theme.nix
  ];

  # Enable Firefox theming
  firefox-theme.enable = true;

  # === GTK Configuration ===
  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };

    # GTK 2.0 configuration
    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme=1
      gtk-button-images=1
      gtk-menu-images=1
      gtk-enable-event-sounds=0
      gtk-enable-input-feedback-sounds=0
    '';

    # GTK 3.0 configuration
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-button-images = 1;
      gtk-menu-images = 1;
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
      gtk-xft-rgba = "rgb";
    };

    # GTK 4.0 configuration
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk3.extraCss = ''
      /* Reversal-Dark GTK 3.0 Theme */

      window {
        background-color: #0b0b0b;
        color: #FFFFFF;
      }

      headerbar {
        background: linear-gradient(to bottom, #171717, #0b0b0b);
        color: #FFFFFF;
        border-bottom: 1px solid #242424;
        box-shadow: 0 1px 3px rgba(0,0,0,0.3);
      }

      headerbar button {
        background: transparent;
        border: none;
        color: #FFFFFF;
        border-radius: 6px;
        transition: all 200ms ease;
      }

      headerbar button:hover {
        background: rgba(91, 155, 248, 0.2);
        color: #5b9bf8;
      }

      button {
        background: #242424;
        color: #FFFFFF;
        border: 1px solid #2C2C2C;
        border-radius: 8px;
        padding: 10px 18px;
        transition: all 200ms ease;
      }

      button:hover {
        background: #5b9bf8;
        border-color: #5b9bf8;
      }

      entry {
        background: #242424;
        color: #FFFFFF;
        border: 1px solid #2C2C2C;
        border-radius: 6px;
        padding: 8px;
      }

      entry:focus {
        border-color: #5b9bf8;
        box-shadow: 0 0 0 2px rgba(91, 155, 248, 0.3);
      }

      scrollbar {
        background: #171717;
        border-radius: 6px;
      }

      scrollbar slider {
        background: #5b5b5b;
        border-radius: 6px;
        min-width: 6px;
        min-height: 6px;
      }

      scrollbar slider:hover {
        background: #FFFFFF;
      }
    '';

    gtk4.extraCss = ''
      /* Reversal-Dark GTK 4.0 Theme */

      window {
        background-color: #0b0b0b;
        color: #FFFFFF;
      }

      headerbar {
        background: linear-gradient(to bottom, #171717, #0b0b0b);
        color: #FFFFFF;
        border-bottom: 1px solid #242424;
        box-shadow: 0 1px 3px rgba(0,0,0,0.3);
      }

      button {
        background: #242424;
        color: #FFFFFF;
        border: 1px solid #2C2C2C;
        border-radius: 8px;
        padding: 10px 18px;
        transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
      }

      button:hover {
        background: #5b9bf8;
        border-color: #5b9bf8;
        transform: translateY(-1px);
        box-shadow: 0 2px 8px rgba(91, 155, 248, 0.3);
      }
    '';
  };

  # === Qt Configuration with Kvantum ===
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
    };
  };

  # === Fonts ===
  fonts.fontconfig.enable = true;

  # === Home packages ===
  home.packages = with pkgs; [
    # Kvantum theming engine (much better than qt5ct/qt6ct)
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum

    # Qt configuration tools (needed since we're using qtct platform theme)
    libsForQt5.qt5ct
    qt6ct

    # Icon and cursor themes
    papirus-icon-theme
    adwaita-icon-theme

    # GTK themes
    gnome-themes-extra

    # Fonts
    nerd-fonts.jetbrains-mono

    # === File Management ===
    # Nautilus - GTK file manager with excellent theming support
    nautilus

    file-roller
  ];

  # === Environment variables ===
  home.sessionVariables = {
    # GTK theme
    GTK_THEME = "Adwaita:dark";

    # Icon theme
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  # === Custom Kvantum theme ===
  xdg.configFile = {
    # Qt5ct configuration to use Kvantum
    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=
      custom_palette=false
      icon_theme=Papirus-Dark
      standard_dialogs=default
      style=kvantum

      [Fonts]
      fixed="JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
      general="JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

      [Interface]
      activate_item_on_single_click=1
      buttonbox_layout=0
      cursor_flash_time=1000
      dialog_buttons_have_icons=1
      double_click_interval=400
      gui_effects=@Invalid()
      keyboard_scheme=2
      menus_have_icons=true
      show_shortcuts_in_context_menus=true
      stylesheets=@Invalid()
      toolbutton_style=4
      underline_shortcut=1
      wheel_scroll_lines=3
    '';

    # Qt6ct configuration to use Kvantum
    "qt6ct/qt6ct.conf".text = ''
      [Appearance]
      color_scheme_path=
      custom_palette=false
      icon_theme=Papirus-Dark
      standard_dialogs=default
      style=kvantum

      [Fonts]
      fixed=@Variant(\0\0\0@\0\0\0\x1c\0J\0\x65\0t\0\x42\0r\0\x61\0i\0n\0s\0M\0o\0n\0o@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\0\x32\0)
      general=@Variant(\0\0\0@\0\0\0\x1c\0J\0\x65\0t\0\x42\0r\0\x61\0i\0n\0s\0M\0o\0n\0o@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\0\x32\0)

      [Interface]
      activate_item_on_single_click=1
      buttonbox_layout=0
      cursor_flash_time=1000
      dialog_buttons_have_icons=1
      double_click_interval=400
      gui_effects=@Invalid()
      keyboard_scheme=2
      menus_have_icons=true
      show_shortcuts_in_context_menus=true
      stylesheets=@Invalid()
      toolbutton_style=4
      underline_shortcut=1
      wheel_scroll_lines=3
    '';

    # Kvantum theme configuration
    "Kvantum/ReversalDark/ReversalDark.kvconfig".text = ''
      [%General]
      author=CamRed25
      comment=Reversal-Dark theme for Kvantum Qt theming
      alt_mnemonic=false
      left_tabs=true
      attach_active_tab=false
      mirror_doc_tabs=true
      group_toolbar_buttons=false
      spread_progressbar=true
      composite=true
      menu_shadow_depth=7
      tooltip_shadow_depth=6
      scroll_width=12
      scroll_arrows=false
      scroll_min_extent=60
      slider_width=6
      slider_handle_width=16
      slider_handle_length=16
      center_toolbar_handle=true
      check_size=16
      textless_progressbar=false
      progressbar_thickness=2
      menubar_mouse_tracking=true
      toolbutton_style=1
      double_click=false
      translucent_windows=false
      blurring=false
      popup_blurring=true
      vertical_spin_indicators=false
      spin_button_width=16
      fill_rubberband=false
      merge_menubar_with_toolbar=true
      small_icon_size=16
      large_icon_size=32
      button_icon_size=16
      toolbar_icon_size=22
      combo_as_lineedit=true
      animate_states=true
      button_contents_shift=false
      combo_menu=true
      hide_combo_checkboxes=true
      combo_focus_rect=true
      groupbox_top_label=true
      inline_spin_indicators=true
      joined_inactive_tabs=true

      [GeneralColors]
      window.color=#0b0b0b
      base.color=#171717
      alt.base.color=#242424
      button.color=#242424
      light.color=#2C2C2C
      mid.light.color=#404040
      dark.color=#1a1a1a
      mid.color=#333333
      text.color=#FFFFFF
      window.text.color=#FFFFFF
      button.text.color=#FFFFFF
      bright.text.color=#FFFFFF
      highlight.color=#5b9bf8
      highlighted.text.color=#FFFFFF
      link.color=#5b9bf8
      link.visited.color=#ab47bc
      tooltip.base.color=#464646
      tooltip.text.color=#FFFFFF

      [Hacks]
      transparent_ktitle_label=true
      transparent_dolphin_view=true
      transparent_pcmanfm_sidepane=true
      blur_translucent=true
      transparent_menutitle=true
      respect_DE=true
      single_top_toolbar=true
      tint_on_mouseover=0
      transparent_pcmanfm_view=false
      no_selection_tint=true
    '';

    # Kvantum global configuration
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=ReversalDark
    '';
  };

  # === XDG Configuration ===
  xdg = {
    enable = true;

    # Set default applications
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "application/x-gnome-saved-search" = "org.gnome.Nautilus.desktop";
      };
    };

    # User directories
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # === Additional Services ===
  services = {
    # Enable file manager daemon for better integration
    gnome-keyring.enable = true;
  };

  # Version for home-manager compatibility
  home.stateVersion = "25.05";
}
