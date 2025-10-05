# backup.nix
# System backup configuration using Restic (currently disabled)
{pkgs, ...}: {
  # Install backup tools
  environment.systemPackages = with pkgs; [
    restic
    rclone # For cloud storage backends
  ];

  # NOTE: Backup services are disabled by default
  # To enable backups:
  # 1. Create password files:
  #    echo 'your-secure-password' | sudo tee /etc/nixos/restic-password
  #    echo 'your-secure-password' | sudo tee /etc/nixos/restic-docs-password
  #    sudo chmod 600 /etc/nixos/restic-password
  #    sudo chmod 600 /etc/nixos/restic-docs-password
  # 2. Replace this file with a properly configured backup.nix
  # 3. Run: sudo nixos-rebuild switch

  # Example configuration is available but commented out
  # Uncomment and modify as needed after creating password files
}
