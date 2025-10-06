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

  # File management and external device support
  services = {
    gvfs.enable = true; # Virtual filesystem support for external drives
    udisks2.enable = true; # Auto-mounting of external drives
  };

  environment.systemPackages = with pkgs; [
    keepassxc
    kdePackages.ark

    # Productivity applications
    rnote # Handwritten notes (great for touchscreen)
    foliate # eBook reader
    dialect # Translation app

    # Design utilities
    contrast # Color contrast checker

    # System utilities
    junction # File opener chooser
    valuta # Currency converter
    warp # Secure file transfer
  ];
}
