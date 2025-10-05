# Stasis Setup and Usage Guide

## Quick Setup

1. **Install and configure Stasis:**
   ```bash
   # Copy configuration to your home directory
   mkdir -p ~/.config/stasis
   cp /home/cam/Nix-config/Dot/stasis/stasis.rune ~/.config/stasis/

   # Install systemd service
   /home/cam/Nix-config/Dot/stasis/stasis-ctl install

   # Start Stasis
   /home/cam/Nix-config/Dot/stasis/stasis-ctl start
   ```

2. **Add scripts to your PATH (optional):**
   ```bash
   # Add to your shell config (~/.config/fish/config.fish)
   set -gx PATH $PATH /home/cam/Nix-config/Dot/stasis
   ```

## Configuration Profiles

### Default Profile
- **Idle timeout:** 15 minutes (screen dims)
- **Lock timeout:** 30 minutes (screen locks)
- **Suspend timeout:** 90 minutes (system suspends)
- **Use case:** General daily usage

### Work Profile
- **Idle timeout:** 10 minutes
- **Lock timeout:** 20 minutes
- **Suspend timeout:** 1 hour
- **Use case:** Professional work, shorter breaks

### Gaming Profile
- **Idle timeout:** 2 hours
- **Lock timeout:** 3 hours
- **Suspend timeout:** 4 hours
- **Use case:** Gaming sessions, minimal interruptions

### Presentation Profile
- **All timeouts disabled**
- **Use case:** Giving presentations, demos

## Smart Features

### Media Detection
Stasis automatically detects:
- ✅ YouTube videos in Firefox
- ✅ Netflix/streaming in browsers
- ✅ Local video playback (MPV, VLC)
- ✅ Music players (Spotify, etc.)
- ✅ Audio streams

### Application Inhibitors
Prevents idle when these apps are running:
- **Gaming:** Steam, Lutris, Heroic, Mindustry, etc.
- **Development:** OBS, Blender, video editors
- **Communication:** Discord, Zoom, Teams
- **Media:** All major video/audio players

### System Integration
- **Laptop lid events:** Auto-suspend on lid close
- **DBus integration:** System event handling
- **Brightness control:** Dims screen before lock
- **Notification system:** Warns before lock/suspend

## Management Commands

### Basic Control
```bash
stasis-ctl start      # Start the daemon
stasis-ctl stop       # Stop the daemon
stasis-ctl restart    # Restart the daemon
stasis-ctl status     # Show current status
stasis-ctl logs       # View recent logs
```

### Configuration
```bash
stasis-ctl config     # Edit configuration file
stasis-ctl test       # Test configuration syntax
```

### Profile Management
```bash
stasis-ctl profiles   # List available profiles
stasis-profile        # GUI profile switcher
```

### Manual Override
```bash
stasis-ctl inhibit    # Manually prevent idle
stasis-ctl uninhibit  # Remove manual inhibition
```

## Niri Integration

### Keybindings (add to niri config.kdl)
```kdl
// Stasis profile switcher
Mod+Shift+P { spawn "/home/cam/Nix-config/Dot/stasis/stasis-profile"; }

// Quick inhibit toggle
Mod+Shift+I { spawn "sh" "-c" "if [ -f /tmp/stasis-manual-inhibit ]; then /home/cam/Nix-config/Dot/stasis/stasis-ctl uninhibit; else /home/cam/Nix-config/Dot/stasis/stasis-ctl inhibit; fi"; }
```

### Startup Integration
Stasis automatically starts with your Niri session via systemd user services.

## Troubleshooting

### Check if Stasis is Running
```bash
stasis-ctl status
```

### View Logs for Issues
```bash
stasis-ctl logs
# Or detailed systemd logs:
journalctl --user -u stasis.service -f
```

### Test Configuration
```bash
stasis-ctl test
```

### Common Issues

1. **Stasis not starting:**
   - Check if Wayland display is available
   - Verify config file syntax
   - Check systemd service status

2. **Apps not being detected:**
   - Check logs for detection attempts
   - Verify app names match regex patterns
   - Enable debug logging in config

3. **Idle not being inhibited:**
   - Verify media detection is working
   - Check CPU/network thresholds
   - Review inhibitor app patterns

### Configuration Customization

Edit `~/.config/stasis/stasis.rune` to customize:
- Timeout values for each profile
- Application inhibitor patterns
- Media detection settings
- Notification preferences
- Hardware detection thresholds

### Advanced Features

1. **Auto Profile Switching:**
   Enable automatic profile changes based on running applications

2. **Performance Monitoring:**
   Monitor CPU/network usage to prevent idle during activity

3. **Custom Actions:**
   Define custom commands for idle/lock/suspend events

## Integration with Your Workflow

### Development Work
- Uses longer timeouts when IDE/terminal is active
- Prevents suspend during builds/compilation
- Smart detection of development tools

### Media Consumption
- Automatically extends timeouts during video playback
- Detects streaming services and local media
- Respects fullscreen applications

### Gaming
- Switches to gaming profile for game launchers
- Very long timeouts for uninterrupted sessions
- Detects major gaming platforms

This intelligent idle management ensures your system stays active when you need it and conserves power when you don't, all while seamlessly integrating with your Niri desktop environment.