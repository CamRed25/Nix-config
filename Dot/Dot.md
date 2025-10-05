# Dot Configuration Directory

This directory contains configuration files and scripts that are symlinked to their appropriate locations in the user's home directory. This approach keeps all configurations organized within the NixOS config while avoiding conflicts with the main system configuration.

## Directory Structure

- **ignis/** - ~~Ignis widget system configurations~~ (Removed in v0.8.0)
- **matugen/** - ~~Matugen color scheme generator settings~~ (Removed - using manual Icy theme)
- **niri/** - Niri compositor configuration files
- **qt5ct/** - ~~Qt5 Configuration Tool settings~~ (Removed - package no longer needed)
- **qt6ct/** - ~~Qt6 Configuration Tool settings~~ (Removed - package no longer needed)
- **stasis/** - Stasis intelligent idle manager configuration and scripts
- **systemd/** - User systemd service files for desktop environment
- **waybar/** - Waybar status bar configuration and styling

## Stasis Integration

The `stasis/` directory contains:

- `stasis.rune` - Main Stasis configuration with intelligent idle management
- `stasis-ctl` - Management script for controlling Stasis daemon
- `stasis-profile` - Quick profile switcher for different usage scenarios

### Stasis Features

- 🧠 Smart idle detection with context awareness
- 🎵 Media-aware idle handling (detects video/audio playback)
- 🚫 Application-specific inhibitors for games, development tools, etc.
- ⚙️ Multiple profiles (work, gaming, presentation)
- 🔍 Native Niri compositor integration
- 📝 Clean RUNE configuration language

## Usage Notes

These configurations are designed to work seamlessly with the Niri desktop environment and provide an integrated, intelligent user experience. The symlink approach ensures that updates to configurations in this repository are immediately reflected in the active desktop session.
