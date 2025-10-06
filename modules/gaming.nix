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
        # mangohud # Moved to main packages to avoid duplication
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
    # === Games ===
    beyond-all-reason # RTS game
    mindustry # Tower defense/factory game
    prismlauncher # Minecraft launcher
    cataclysm-dda-git # Survival roguelike
    starsector # Space exploration/combat

    # === Game Launchers ===
    heroic # Epic Games launcher
    lutris # Multi-platform game launcher
    discord # Gaming communication

    # === Gaming Tools ===
    mangohud # Performance overlay
    dxvk # DirectX to Vulkan translation
    mesa # OpenGL implementation

    # === Controller Support ===
    antimicrox # Gamepad to keyboard mapping
    jstest-gtk # Joystick testing tool

    # === Performance Tools ===
    gamemode # CPU governor optimization (also in programs)

    # === Additional Launchers ===
    nur.repos.ataraxiasjel.gamma-launcher

    # === Wine Gaming ===
    bottles # Wine prefix manager (alternative to Lutris)
    winetricks # Wine configuration utility
  ];
}
