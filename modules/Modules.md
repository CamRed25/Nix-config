# Modules

This folder contains reusable NixOS modules. Each `.nix` file provides a specific configuration or functionality that can be imported into your host or system configurations.

## Purpose

- Centralize and document custom NixOS modules.
- Modules here are cherry-picked for use in my hosts. I plan to add more modules as needed and may refactor or split large modules for better usability.

## Usage

- Each module is labeled for my own reference. Documentation may be limited, but I will try to improve it over time.

## Available Modules

- **common.nix**: Common configurations shared across multiple hosts (networking, browsers, email, etc.).
- **dev.nix**: CLI tools and other development-related utilities.
- **localization.nix**: Locale, timezone, keyboard layout, and related settings.
- **nix.nix**: Nix settings, garbage collection, and related configurations.
- **nvidia.nix**: NVIDIA drivers and related settings.
- **security.nix**: Security settings, firewall, and related configurations.

## Future Modules

- **cli.nix**: CLI tools and settings.
- **minecraft.nix**: Minecraft server and related settings.
- etc.