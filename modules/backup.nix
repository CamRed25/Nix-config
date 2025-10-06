# backup.nix
# System backup configuration using Restic (currently disabled)
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    restic
    rclone
  ];

  # Backup services are disabled by default
}
