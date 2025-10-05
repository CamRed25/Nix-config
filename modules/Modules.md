# Modules

This folder contains reusable NixOS modules. Each `.nix` file provides a specific configuration or functionality that can be imported into your host or system configurations.

## Purpose

Centralize and document custom NixOS modules. Modules here are cherry-picked for use in my hosts. I plan to add more modules as needed and may refactor or split large modules for better usability.

## Usage

Each module is labeled for my own reference. Documentation may be limited, but I will try to improve it over time.

## Available Modules

| Module               | Description                                                     | Status    |
|----------------------|-----------------------------------------------------------------|-----------|
| `common.nix`         | Basic system essentials, networking, browsers, and file management | ✅ Active |
| `localization.nix`   | Time zone, time sync, keyboard layout and locale settings      | ✅ Active |
| `security.nix`       | Firewall, fail2ban, AppArmor, audit system, and security tools | ✅ Active |
| `nix.nix`            | Nix package manager settings, overlays, and optimizations      | ✅ Active |
| `gaming.nix`         | Gaming packages, Steam, and gaming optimizations               | ✅ Active |
| `dev.nix`            | Development tools, CLI utilities, and productivity packages    | ✅ Active |
| `nvidia.nix`         | NVIDIA drivers and hardware acceleration                       | ✅ Active |
| `cleaning.nix`       | System maintenance and cleanup utilities                       | ✅ Active |
| `backup.nix`         | Automated Restic backup system with scheduling and monitoring  | ✅ Active |
| `fonts.nix`          | System fonts, font packages, and font configuration            | ✅ Active |
| `multimedia.nix`     | Media codecs, players, audio/video support, and hardware acceleration | ✅ Active |
| `monitoring.nix`     | System monitoring tools, hardware health checks, and diagnostics | ✅ Active |

## Future Modules

Planned modules may include:

- `minecraft.nix`: Minecraft server and related settings.
- Others as needed.
