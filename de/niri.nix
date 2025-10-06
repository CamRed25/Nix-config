# Niri Wayland Compositor Configuration
# Provides a complete Niri desktop environment with all necessary services,
# utilities, and applications for a functional Wayland-first workflow.
{pkgs, ...}: let
  # === Custom Package Definitions ===
  # Import custom Niri ecosystem packages from local pkgs/ directory
  niri-companion = pkgs.callPackage ../pkgs/niricompanion.nix {
    inherit (pkgs) python313;
  };
  niri-session-manager = pkgs.callPackage ../pkgs/niri-session-manager.nix {};
  niri-switch = pkgs.callPackage ../pkgs/niri-switch.nix {};
  stasis = pkgs.callPackage ../pkgs/stasis.nix {};

  # === External Dependencies ===
  # Import pinned sources and NUR repository
  pins = import ../npins;
  nur = import pins.nur-combined {inherit pkgs;};
in {
  # === Module Imports ===
  imports = [
    ../modules/wayland.nix # Wayland environment and XDG portals
    ../modules/security.nix # Security and PAM configuration
  ];

  # === Core Niri Configuration ===
  programs.niri = {
    enable = true;
  };

  # === Desktop Environment Variables ===
  environment.sessionVariables = {
    # Desktop environment identification
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_DESKTOP = "niri";
  };

  # === Niri-specific System Packages ===
  environment.systemPackages = with pkgs; [
    # === Core Niri Ecosystem ===
    niri-companion # Niri toolkit and utilities
    niri-session-manager # Session layout management
    niri-switch # Fast Alt-Tab alternative
    niriswitcher # Window switcher utility
    nirius
    nur.repos.linyinfeng.niri-taskbar # Application taskbar widget

    # === Session Management ===
    stasis # Intelligent idle manager

    # === Desktop Shell Components ===
    waybar # Highly customizable status bar
    swww # Wallpaper manager for Wayland

    # === Application Launchers ===
    walker # Advanced Wayland launcher with plugins
    fuzzel # Lightweight application launcher
    anyrun # Extensible launcher with niri-focus plugin

    # === Core Applications ===
    ghostty # Modern terminal emulator
    nautilus # GTK file manager with theming support

    # === Clipboard & Utilities ===
    cliphist # Clipboard history manager

    # === Screenshots & Screen Capture ===
    shotman # Screenshot utility

    # === Notifications ===
    swaynotificationcenter # Notification daemon and control center

    # === Session & Security ===
    soteria # Modern GTK4 polkit agent (primary)
    kdePackages.polkit-kde-agent-1 # KDE polkit agent (fallback)
    gtklock # GTK-based screen locker
    wleave # Power/logout menu

    # === Display Management ===
    kanshi # Automatic display configuration

    # === System Integration ===
    xwayland-satellite # X11 application compatibility
    lxqt.lxqt-config # Qt application configuration

    # === System Utilities ===
    coreutils # Basic system utilities
  ];
}
