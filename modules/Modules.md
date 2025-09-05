# Modules

This folder contains reusable NixOS modules. Each `.nix` file provides a specific configuration or functionality that can be imported into your host or system configurations.

## Purpose

- The purpose of this folder is to centralize and document custom NixOS modules. I actually will be cherry-picking from here to my hosts. I plan on adding more modules as I create them and possibly shrinking some of them since they are too large for most of my hosts.

## Usage
- each of the modules are label for each labeling for me, and I may not have documentation for each one, but ill try to remember for the future.


## Available Modules
- common.nix: A module containing common configurations shared across multiple hosts. Networking,browsers,email, etc...
- dev.nix: fortmatting Cli tools and other such dev related tools.
- localization.nix: configurations related to locale, timezone,keyboard layout, etc...
- nix.nix: configurations related to nix settings, garbage collection, etc...
- nvidia.nix: configurations related to nvidia drivers and settings.
- security.nix: configurations related to security settings, firewall, etc...