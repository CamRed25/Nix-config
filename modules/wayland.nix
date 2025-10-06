# wayland.nix
# Wayland compositor environment and portal configuration
{pkgs, ...}: {
  # === Wayland Environment Variables ===
  environment.sessionVariables = {
    # Wayland application support
    NIXOS_OZONE_WL = "1"; # Enable Wayland for Electron apps
    MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland for Firefox
    QT_QPA_PLATFORM = "wayland"; # Qt applications use Wayland
    SDL_VIDEODRIVER = "wayland"; # SDL applications use Wayland
    _JAVA_AWT_WM_NONREPARENTING = "1"; # Fix Java apps on tiling WMs
  };

  # === XDG Portal Configuration ===
  # Essential for proper Wayland desktop integration
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      # Portal backends - prioritize wlr for Niri compatibility
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr # Primary portal for wlroots compositors
        xdg-desktop-portal-gtk # Fallback for GTK applications
        xdg-desktop-portal-gnome # Fallback for GNOME applications
      ];

      # Portal configuration - optimize for Niri/wlroots
      config = {
        niri = {
          default = ["wlr" "gtk"];
          "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
          "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
          "org.freedesktop.impl.portal.RemoteDesktop" = ["wlr"];
        };
      };

      # wlroots portal settings
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

    # XDG desktop integration
    mime.enable = true;
    menus.enable = true;
    icons.enable = true;
    sounds.enable = true;
    autostart.enable = true;
  };

  # === Wayland-specific packages ===
  environment.systemPackages = with pkgs; [
    # XDG & Desktop Integration
    xdg-user-dirs
    xdg-utils
    shared-mime-info
    desktop-file-utils

    # Wayland utilities
    wl-clipboard
    slurp
    grim
  ];
}
