# gaming.nix
{pkgs, ...}: let
  pins = import ../npins;
  nur = import pins.nur-combined {inherit pkgs;};
in {
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      # Fonts handled by fonts.nix module
      extraPackages = with pkgs; [
        vulkan-loader
        libvdpau
        gamemode
        mangohud
        libva
        libxkbcommon
        libinput
        libusb1
        udev
        xorg.libX11
        xorg.libXrandr
        xorg.libXcursor
        xorg.libXi
        xorg.libXext
        xorg.libXft
        xorg.libXinerama
        xorg.libXcomposite
        nss
        gnutls
        atk
        at-spi2-atk
      ];
    };
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    # java = {
    #   enable = true;
    #   package = pkgs.jdk24;
    # };
    # If you need to use this as well either uncomment and don't use dev.nix or use dev.nix as well.
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [obs-websocket];
    };
  };

  environment.systemPackages = with pkgs; [
    beyond-all-reason
    mindustry
    prismlauncher
    cataclysm-dda-git
    # limo #cant be built due to loot api changing.
    starsector
    heroic
    mangohud
    #modrinth-app-unwrapped #never worked for me x11 or wayland.
    discord
    lutris
    dxvk
    mesa
    nur.repos.ataraxiasjel.gamma-launcher
  ];
}
