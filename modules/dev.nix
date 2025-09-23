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
      shellAliases = {
        ls = "ls -R";
        build = "cd /home/cam/Nix-config/scripts && ./rebuild.sh";
        rbc = "cd /home/cam/Nix-config/scripts && ./RBC.sh"; # does a complete build, aka: refreshes pins and updates and grades npins, then does a build.
        clean = ''
          sudo nix-collect-garbage -d &&
          sudo nix-store --verify &&
          sudo nix-store --optimise &&
          nix-collect-garbage -d &&
          nix-store --verify &&
          nix-store --optimise &&
          sudo nh clean all &&
          nh clean all
        '';
        new = "cd /home/cam/nix-config && npins update && npins upgrade"; # same as rbc but without the build step
      };
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
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
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
    nh
    # editors & terminals
    vscode
    # dev libraries/tools
    vulkan-tools
    glxinfo
    # add future dev stuff here
  ];
}
