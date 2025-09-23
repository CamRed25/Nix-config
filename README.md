# My NixOS Configuration

Welcome to my NixOS journey! 🎉

This repository contains my personal NixOS configuration setup. As this is my *first* time working with coding and config editing, I'm excited to explore the power of NixOS.

---

## 🎯 Project Overview

<details>
<summary><strong>Current Status & Goals</strong></summary>

| Aspect | Status | Details |
|--------|--------|---------|
| **Progress** | 🚧 Work in Progress | Ongoing changes and improvements as I learn |
| **Purpose** | 🧪 Learning & Experimentation | Sandbox for trying new modules, DEs, and deployment strategies |
| **Goal** | 🎯 Module-Based System for All Machines | Build solid, personalized NixOS configuration for multiple machines |
| **Deployment** | 🔍 Always Changing, Never Static | Evaluating [nilla](https://github.com/nilla-nix/nilla), [colmena](https://github.com/zhaofengli/colmena) |
| **Display** | 🖥️ Hybrid Setup | Wayland compositor (niri/KDE) + X11 support |

</details>

---

## 📁 Directory Structure & Documentation

| Path | Description |
|------|-------------|
| hosts/ | Per-machine configurations. See [Hosts.md](hosts/Hosts.md). |
| de/ | Wayland (niri) + KDE configs. See [DesktopEnvironments.md](de/DesktopEnvironments.md). |
| modules/ | Reusable modules (cleaning, gaming, dev, nvidia, etc). See [Modules.md](modules/Modules.md). |
| npins/ | Pin definitions for reproducibility. See [Npins.md](npins/Npins.md). |
| scripts/ | Rebuild / formatting scripts (WIP). |
| changelog.asciidoc | Full version history. See [changelog.asciidoc](changelog.asciidoc) for a summary of changes and updates. |

---

## 📋 Changelog

See [changelog.asciidoc](changelog.asciidoc) for full versioned history (additions: niri environment, cleaning module, expanded pins, companion tooling, taskbar, deployment prep).

## 🚀 Roadmap (Short-term)

- [ ] Migrate secrets to agenix or sops-nix
- [ ] Remove deprecated lxqtniri session and/or fix if able
- [ ] Evaluate deployment tooling (nilla / colmena)
- [ ] Harden security module further: isolate without compromising usability

---

## 📝 Configuration Notes

<details>
<summary><strong>Display & Graphics</strong></summary>

**X11 vs Wayland:** Currently using X11 daily due to better NVIDIA gaming performance. Will revisit Wayland as support improves.

</details>

<details>
<summary><strong>Security & Secrets</strong></summary>

**Secrets Management:** Sensitive commands are present in `configuration.nix`. Planning to use [agenix](https://github.com/ryantm/agenix) or [sops](https://github.com/Mic92/sops-nix) for secrets in the future.

</details>

<details>
<summary><strong>Package Management</strong></summary>

| Tool | Usage | Notes |
|------|-------|-------|
| **npins** | Primary dependency management | Leverages "npins import-flake" feature |
| **flake.nix** | Tracked intentionally | Interoperates with npins import-flake |
| **Versioning** | 0.1.0 updates | Focus on npins (pin sources and versions) |

</details>

<details>
<summary><strong>Development Status</strong></summary>

| Component | Status | Notes |
|-----------|--------|-------|
| `./modules/home` | 🚫 Not in use | Removed for invalidation |
| `./de/homede` | 🚫 Not in use | Removed for invalidation |
| `de/lxqtniri.nix` | ⚠️ Deprecated | Retained for reference (pending deletion) |

</details>

---

## 🤝 Contributions & Collaboration

I welcome ideas, improvements, or fixes! Please open a Pull Request (PR) or share feedback and suggestions.

If you encounter issues or something isn't working, let me know. I'm likely facing similar challenges, so we can figure things out together.

---

## 🏁 Getting Started

Feel free to clone, inspect, and adapt this configuration for your own needs. Each section is documented to help you understand and reuse parts of my setup. Check the linked documentation files above for more information.

---

## 👋 A Little About Me

> "As a newcomer to NixOS and system configurations, I'm learning as I go. This repository is both a personal learning journal and a functional setup. Thanks for stopping by, and happy hacking! 🚀"

---

*Cheers,*
A fellow NixOS explorer
