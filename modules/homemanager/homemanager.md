# Home-Manager Modules

This directory contains home-manager specific modules that configure user-level settings and applications.

## Structure

- `theming.nix` - GTK, Qt, and Kvantum theming configuration
- `firefox-theme.nix` - Firefox LittleFox CSS theme management

## Usage

These modules are imported by the main `modern-theming.nix` module and are applied to user environments through home-manager.

## Organization

- **System modules**: Located in `/modules/` - handle system-wide configuration
- **Home-manager modules**: Located in `/modules/homemanager/` - handle user-specific configuration

This separation provides better organization and makes it clear which modules affect system vs user configurations.