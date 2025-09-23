{pkgs, ...}: let
  niri-companion = pkgs.callPackage ../pkgs/niri-companion.nix {};
  pins = import ../npins;
  nur = import pins.nur-combined {inherit pkgs;};
in {
  programs.niri = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
    config = {
      niri.default = ["wlr" "gtk"]; # Use wlr portal for niri since it supports wlroots protocols
    };
  };

  environment.systemPackages = with pkgs; [
    # Window management and desktop
    niriswitcher
    niri-companion #(pinned)
    nur.repos.linyinfeng.niri-taskbar #(pinned)
    # Terminal and applications
    ghostty
    kdePackages.dolphin
    fuzzel

    # Notifications and wallpapers
    mako
    swww
    swaybg

    # Screen utilities
    shotman
    clight
    clight-gui

    # Session management and security
    swayidle
    swaylock
    gnome-keyring
    kdePackages.polkit-kde-agent-1

    # System utilities
    networkmanagerapplet
    xwayland-satellite
    themechanger
  ];
}
