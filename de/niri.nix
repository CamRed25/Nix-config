{pkgs, ...}: let
  niri-companion = pkgs.callPackage ../pkgs/niricompanion.nix {
    inherit (pkgs) python313;
  };
  niri-session-manager = pkgs.callPackage ../pkgs/niri-session-manager.nix {};
  niri-switch = pkgs.callPackage ../pkgs/niri-switch.nix {};
  pins = import ../npins;
  nur = import pins.nur-combined {inherit pkgs;};
  stasis = pkgs.callPackage ../pkgs/stasis.nix {};
in {
  programs.niri = {
    enable = true;
  };

  # Set proper environment variables for Niri session
  environment.sessionVariables = {
    # Ensure Niri is detected as the desktop environment
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_DESKTOP = "niri";

    # Wayland-specific variables
    NIXOS_OZONE_WL = "1"; # Enable Wayland for Electron apps
    MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland for Firefox
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1"; # Fix Java apps on tiling WMs
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      config = {
        # Niri uses wlroots protocols, so prioritize wlr portal
        niri = {
          default = ["wlr" "gtk"];
          "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
          "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
          "org.freedesktop.impl.portal.RemoteDesktop" = ["wlr"];
        };
      };
      wlr = {
        enable = true;
        settings = {
          screencast = {
            max_fps = 30;
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
          };
        };
      };
    };
    mime = {
      enable = true;
    };
    menus.enable = true;
    icons.enable = true;
    sounds.enable = true;
    autostart.enable = true;
  };

  # Security and session management
  security = {
    polkit.enable = true;
    pam.services.gtklock = {
      text = ''
        auth      include login
        account   include login
        password  include login
        session   include login
      '';
    }; # Enable PAM for gtklock with proper authentication
  };

  # Services for Niri session
  services = {
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true; # For power management

    # Enable dbus for proper session management
    dbus = {
      enable = true;
      packages = with pkgs; [gnome-keyring];
    };
  };

  # Remove duplicates in systemPackages
  environment.systemPackages = with pkgs; [
    # Core Niri ecosystem
    niri-companion
    niri-session-manager
    niri-switch
    niriswitcher
    nur.repos.linyinfeng.niri-taskbar
    nirius

    # Desktop shell and widgets
    stasis
    waybar # Highly customizable Wayland bar

    # Theming and wallpapers
    swww

    # Application launchers
    walker # Advanced wayland launcher with plugins
    fuzzel
    anyrun # Advanced wayland launcher with niri-focus plugin
    # Core applications
    ghostty
    kdePackages.dolphin

    # Clipboard and utilities
    wl-clipboard
    cliphist

    # Notifications and screenshots
    shotman

    # Session and security
    gnome-keyring
    kdePackages.polkit-kde-agent-1 # For KDE sessions
    soteria # For Niri sessions - Modern GTK4 polkit agent
    gtklock # GTK-based screen locker with modules
    swaynotificationcenter
    wleave # Power/logout menu

    # Display and audio management
    kanshi # Automatic display configuration for multi-monitor setups

    # System utilities
    networkmanagerapplet
    xwayland-satellite

    # XDG and theming utilities
    xdg-user-dirs
    xdg-utils
    lxqt.lxqt-config

    # Additional utilities
    coreutils
    slurp # For screenshots and screen selection
    grim # For screenshots
  ];
}
