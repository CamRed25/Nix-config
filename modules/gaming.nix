{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      fontPackages = with pkgs; [
        corefonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        dejavu_fonts
      ];
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
    #java = {
    #  enable = true;
    #  package = pkgs.jdk24;
    #};
    #If you need to use this as well either uncomment and dont use dev.nix or use dev.nix as well.
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
    ##limo
    starsector
    heroic
    mangohud
    modrinth-app
    discord
    lutris
    dxvk
    mesa
  ];
}
