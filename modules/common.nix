# common.nix
{pkgs, ...}: {
  networking = {
    hostName = "cam";
    networkmanager.enable = true;
  };

  programs = {
    firefox.enable = true;
    thunderbird.enable = true;
    command-not-found.enable = false;
  };

  environment.systemPackages = with pkgs; [
    keepassxc
    kdePackages.ark
  ];
  environment.shellAliases = {
    ls = "ls -R";
    build = "cd /home/cam/Nix-config/scripts && ./rebuild.sh";
    rbc = "cd /home/cam/Nix-config/scripts && ./RBC.sh"; # does a complete build, aka: refreshes pins and updates and grades npins, then does a build.
    clean = "sudo nix-collect-garbage -d && sudo nix-store --verify && sudo nix-store --optimise && nix-collect-garbage -d && nix-store --verify && nix-store --optimise && sudo nh clean all && nh clean all";
  };
}
