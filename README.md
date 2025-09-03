# My NixOS Configuration

Welcome to my NixOS journey! 🎉

This repository contains my personal NixOS configuration setup. As this is my *first* time working with coding and config editing, I'm excited to explore the power of NixOS.

---

## About This Repo

- **Work in Progress:** Expect ongoing changes and improvements as I learn.
- **Learning & Experimentation:** Things may not always be perfect; I'm experimenting and learning as I go.
- **Goal:** Build a solid, reproducible, and personalized NixOS system configuration.
- **Deployment Tools:** I'm considering using [nilla](https://github.com/nilla-nix/nilla) or another deployment tool.
- **Window Manager/Compositor:** Planning to include a Wayland compositor (e.g., Sway or Wayfire).

---

## Directory Structure

- **hosts/**: Future setup for managing configurations for multiple systems.
- **scripts/**: Contains rebuild and formatting scripts for my system.

---

## Notes

- **X11 vs Wayland:** I currently use X11 daily because Wayland with NVIDIA results in low FPS for gaming, while X11 performs normally.
- **Secrets Management:** My `configuration.nix` currently contains some sensitive commands. I plan to use [agenix](https://github.com/ryantm/agenix) or [sops](https://github.com/Mic92/sops-nix) for secret management once I learn more about them.

---

## Contributions & Collaboration

I welcome ideas, improvements, or fixes! Please open a Pull Request (PR) or share feedback and suggestions.

If you encounter issues or something isn't working, let me know. I’m likely facing similar challenges, so we can figure things out together.

---

## Getting Started

Feel free to clone, inspect, and adapt this configuration for your own needs.

---

## A Little About Me

> "As a newcomer to NixOS and system configurations, I'm learning as I go. This repository is both a personal learning journal and a functional setup. Thanks for stopping by, and happy hacking! 🚀"

---

*Cheers,*

*A fellow NixOS explorer*
