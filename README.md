# My NixOS Configuration

Welcome to my NixOS journey! 🎉

This repository contains my personal NixOS configuration setup. As this is my *first* time working with coding and config editing, I'm excited to explore the power of NixOS.

---

## About This Repo

- **Work in Progress:** Expect ongoing changes and improvements as I learn more about NixOS, its ecosystem, and best practices.
- **Learning & Experimentation:** This repository is a sandbox for trying out new modules, desktop environments, and deployment strategies. Mistakes and experiments are part of the process!
- **Goal:** Build a solid, reproducible, and personalized NixOS system configuration that can be easily deployed to multiple machines.
- **Deployment Tools:** I'm considering using [nilla](https://github.com/nilla-nix/nilla), [colmena](https://github.com/zhaofengli/colmena), or other deployment tools for managing multiple hosts.
- **Window Manager/Compositor:** Planning to include a Wayland compositor (e.g., Sway or Wayfire) in addition to X11-based setups.

---

## Directory Structure & Documentation

- **hosts/**: Per-machine configurations. See [Hosts.md](hosts/Hosts.md) for details about each host and their roles.
- **de/**: Desktop environment configurations. See [DesktopEnviroments.md](de/DesktopEnviroments.md) for a list of supported environments and usage notes.
- **modules/**: Custom reusable NixOS modules. See [Modules.md](modules/Modules.md) for documentation on available modules and their purposes.
- **npins/**: Pin definitions for external sources and channels. See [Npins.md](npins/Npins.md) for a list of pins and future plans.
- **scripts/**: Contains rebuild and formatting scripts for my system (not yet fully documented).
- **changelog.asciidoc**: Project changelog with detailed version history. See [changelog.asciidoc](changelog.asciidoc) for a summary of changes and updates.

---

## Notes

- **X11 vs Wayland:** Currently using X11 daily due to better NVIDIA gaming performance. Will revisit Wayland as support improves.
- **Secrets Management:** Sensitive commands are present in `configuration.nix`. Planning to use [agenix](https://github.com/ryantm/agenix) or [sops](https://github.com/Mic92/sops-nix) for secrets in the future.
- **Documentation:** Each major folder has a `.md` file with more details. Refer to those for specifics on hosts, modules, DEs, and pins.
- **Changelog Versioning:** 0.1.0 updates focus on npins (pin sources and versions).
- **npins Customization:** Most of the npins section can be removed or customized. Future comments will clarify which parts are essential.
- **Note:** `./modules/home` and `./de/homede` are not in use currently, but may be in the future.
- **.gitignore:** `flake.nix` and `flake.lock` are included because I use npins to manage external dependencies, leveraging its "npins import-flake" feature.

---

## Contributions & Collaboration

I welcome ideas, improvements, or fixes! Please open a Pull Request (PR) or share feedback and suggestions.

If you encounter issues or something isn't working, let me know. I’m likely facing similar challenges, so we can figure things out together.

---

## Getting Started

Feel free to clone, inspect, and adapt this configuration for your own needs. Each section is documented to help you understand and reuse parts of my setup. Check the linked documentation files above for more information.

---

## A Little About Me

> "As a newcomer to NixOS and system configurations, I'm learning as I go. This repository is both a personal learning journal and a functional setup. Thanks for stopping by, and happy hacking! 🚀"

---

*Cheers,*

A fellow NixOS explorer
