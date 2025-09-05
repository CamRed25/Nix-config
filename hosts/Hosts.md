# Hosts Configurations

This folder contains the NixOS configuration files for each of my machines ("hosts").

## Purpose

Each host has its own configuration file specifying the hardware and software setup for that particular machine. This allows me to manage multiple devices with different requirements using NixOS.

## Usage Disclaimer

- Feel free to reference these files, but ensure you actually need the configurations before using them.
- These setups are tailored for my machines. I do not guarantee they will work for you.
- I'll be including in .nix file a comment at the top of each file to describe what each host is for and any special configurations it may have/need.

## Hosts

- **Earth.nix**: My Microsoft Surface tablet. (Get it? "Surface" → "Earth")
- **Mercury.nix**: My SteamDeck. I plan to migrate it to NixOS in the future; currently, it's running Arch (stock Steamos). There are likely better SteamDeck configs available, such as [Jovian-NixOS](https://github.com/Jovian-Experiments/Jovian-NixOS).
- **Moon.nix**: My main laptop, mostly used for YouTube, email, and some light programming.
- **Star.nix**: My desktop PC. It's a bit old, but still capable of running games.