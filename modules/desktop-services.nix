# desktop-services.nix
# System services for desktop environments
{pkgs, ...}: {
  # === System Services ===
  services = {
    # File system integration
    gvfs.enable = true; # Network/removable media support
    udisks2.enable = true; # Removable media management

    # Authentication and credentials
    gnome.gnome-keyring.enable = true;

    # Power management
    power-profiles-daemon.enable = true;

    # D-Bus session management
    dbus = {
      enable = true;
      packages = with pkgs; [
        gnome-keyring
        gsettings-desktop-schemas
      ];
    };
  };

  # === Desktop Integration ===
  programs.dconf.enable = true;

  # === System Packages for Desktop Services ===
  environment.systemPackages = with pkgs; [
    # System integration
    glib
    gsettings-desktop-schemas

    # Network management
    networkmanagerapplet

    # Notification system
    libnotify
  ];
}
