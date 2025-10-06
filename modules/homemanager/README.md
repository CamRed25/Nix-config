# Home-Manager Modules

This subdirectory contains user-level configuration modules that are specifically designed for home-manager integration. These modules handle user-space configurations and theming that don't require system-level privileges.

## Purpose

Separate user-level configurations from system-level modules for better organization and maintainability. These modules focus on:
- User application theming and customization
- Personal configuration files and settings
- Desktop environment user preferences
- Application-specific user configurations

## Available Modules

### `firefox-theme.nix`
- **Purpose**: Firefox LittleFox theme integration with custom Reversal-Dark colors
- **Features**:
  - LittleFox CSS theme from npins source
  - Custom color scheme integration
  - Automatic theme installation and activation
  - User preference configuration

### `theming.nix`
- **Purpose**: GTK theming and desktop integration for user applications
- **Features**:
  - GTK 3/4 theme configuration with Reversal-Dark colors
  - Nautilus file manager integration
  - Desktop environment theming
  - User-level service imports

## Integration

These modules are imported through the main `modules/modern-theming.nix` which handles the home-manager integration and ensures proper loading order.

## Usage

Modules in this directory should be imported via home-manager configuration, not directly as NixOS system modules. They are designed to work within the user session context.