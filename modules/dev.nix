# dev.nix
{
  lib,
  config,
  pkgs,
  ...
}: let
  # Import npins for hardware-specific packages
  pins = import ../npins;
  npins = import pins.npins {inherit pkgs;};
in {
  programs = {
    direnv.enable = true;
    starship.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    bat = {
      enable = true;
      settings = {
        "italic-text" = "always";
        "map-syntax" = [
          "*.ino:C++"
          ".ignore:Git Ignore"
        ];
      };
    };
    fish = {
      enable = true;
      shellInit = lib.mkIf config.programs.fish.enable ''
        # Custom fish shell init commands here
      '';
    };
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
    htop.enable = true;
    nix-ld.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk24;
    };
  };

  environment.systemPackages = with pkgs; [
    # formatters/linters
    alejandra
    deadnix
    statix
    # Nix/dev utilities
    nix-health
    npins
    nil
    # editors & terminals
    vscode
    ghostty
    xdg-ninja
    # dev libraries/tools
    vulkan-tools
    glxinfo
    # add future dev stuff here
  ];
}
