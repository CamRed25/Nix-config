# modern-theming.nix
# Home Manager integration and core theming configuration
{
  pkgs,
  lib,
  ...
}: let
  sources = import ../npins;
in {
  # Import required modules
  imports = [
    (sources.home-manager + "/nixos")
    ./desktop-services.nix # Desktop services (GVFS, polkit, etc.)
  ];

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.cam = {pkgs, ...}: {
      # Import home-manager theming configuration
      imports = [
        ./homemanager/theming.nix
      ];
    };
  };

  # System-wide packages for theme support only
  environment.systemPackages = with pkgs; [
    # Theme configuration tools
    lxappearance

    # Font rendering
    fontconfig
    cairo
  ];
}
