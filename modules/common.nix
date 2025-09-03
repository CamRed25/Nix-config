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
  ];
}
