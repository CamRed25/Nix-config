#this is gonna be deleted pretty soon
#i just wanted to see if i could get lxqt-niri-session working and
#it was a massive failure. feel free to copy and use what you want. but beware
#that this is a mess and probably not the best way to do things.
{pkgs, ...}: let
  niri-companion = import ../pkgs/niri-companion.nix {
    inherit pkgs; # pass your package set here
  };
  pins = import ../npins;
  nur = import pins.nur-combined {inherit pkgs;};
in {
  services = {
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      xkb.layout = "us";
      desktopManager.lxqt.enable = true;
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
      sessionPackages = [pkgs.lxqt.lxqt-wayland-session];
    };
  };

  programs.niri.enable = true;
  programs.waybar.enable = true;
  programs.waybar.systemd.target = "graphical-session.target";
  xdg.portal = {
    enable = true;
    wlr.enable = true; # For wlroots compositors (sway, hyprland, etc.)
    extraPortals = with pkgs; [xdg-desktop-portal-wlr gnome-keyring];
    config = {
      wlr.default = ["wlr" "gtk"]; # Order of portal usage
    };
  };
  security.soteria.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    swayidle
    swaylock
    lxqt.lxqt-wayland-session
    xorg.libXcursor
    ghostty
    mako
    xcb-util-cursor-HEAD
    icon-slicer
    xwayland-satellite
    clight
    clight-gui
    nur.repos.linyinfeng.niri-taskbar #(pinned)
    waypaper
    swww
    swaybg
    shotman
    kdePackages.dolphin
    niri-companion #(pinned)
  ];
}
