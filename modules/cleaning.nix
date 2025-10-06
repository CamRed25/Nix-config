# cleaning.nix
# System maintenance and cleanup utilities
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # XDG compliance and cleanup
    xdg-ninja # Check for XDG compliance issues

    # System cleanup tools
    bleachbit # GUI system cleaner
    ncdu # Disk usage analyzer (already in monitoring.nix)
    du-dust # Modern disk usage analyzer (already in monitoring.nix)

    # Package and cache cleanup
    nix-tree # Visualize Nix store dependencies
    nix-du # Disk usage of Nix store paths

    # Duplicate file finders
    rmlint # Fast duplicate file finder
    fdupes # Find duplicate files

    # Temporary file cleanup
    tmpwatch # Clean old temporary files

    # Note: journalctl is already available as part of systemd
  ];

  # Automated cleanup services
  systemd.services = {
    # Weekly XDG compliance check
    xdg-compliance-check = {
      description = "Check XDG Base Directory compliance";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.xdg-ninja}/bin/xdg-ninja";
        User = "cam";
      };
    };
  };

  systemd.timers = {
    xdg-compliance-check = {
      description = "Run XDG compliance check weekly";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = true;
      };
    };
  };
}
