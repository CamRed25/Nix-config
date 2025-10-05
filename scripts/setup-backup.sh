#!/usr/bin/env bash
# setup-backup.sh - Initialize backup system

set -e

echo "🔐 Setting up Restic backup system..."

# Create password files if they don't exist
if [ ! -f /etc/nixos/restic-password ]; then
    echo "Creating main backup password file..."
    echo "Please enter a secure password for the main backup repository:"
    read -s password
    echo "$password" | sudo tee /etc/nixos/restic-password > /dev/null
    sudo chmod 600 /etc/nixos/restic-password
    echo "✅ Main backup password file created"
else
    echo "✅ Main backup password file already exists"
fi

if [ ! -f /etc/nixos/restic-docs-password ]; then
    echo "Creating documents backup password file..."
    echo "Please enter a secure password for the documents backup repository:"
    read -s password
    echo "$password" | sudo tee /etc/nixos/restic-docs-password > /dev/null
    sudo chmod 600 /etc/nixos/restic-docs-password
    echo "✅ Documents backup password file created"
else
    echo "✅ Documents backup password file already exists"
fi

# Create backup directories
sudo mkdir -p /var/backups
echo "✅ Backup directories created"

echo "
🚀 Backup system setup complete!

Next steps:
1. Rebuild your system: sudo nixos-rebuild switch
2. Initialize repositories: sudo systemctl start restic-init.service
3. Run first backup: sudo systemctl start restic-backups-system.service
4. Check backup status: sudo systemctl status restic-backups-system.service

📋 Backup configuration:
- Main backup: /var/backups/restic-repo (daily)
- Documents backup: /var/backups/restic-docs-repo (3x daily)
- Retention: 7 daily, 4 weekly, 6 monthly, 2 yearly

⚙️  To customize backup location:
Edit /home/cam/Nix-config/modules/backup.nix and change the 'repository' settings.

Examples:
- External drive: /mnt/backup/restic-repo
- Network location: sftp:user@host:/path/to/repo
- Cloud storage: s3:s3.amazonaws.com/bucket-name
"