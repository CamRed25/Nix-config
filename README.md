# My NixOS Configuration

Welcome to my NixOS journey! 🎉

This repository contains my personal NixOS configuration setup. As this is my *first* time working with coding and config editing, I'm excited to explore the power of NixOS.

---

## 🎯 Project Overview

<details>
<summary><strong>Current Status & Goals</strong></summary>

| Aspect | Status | Details |
|--------|--------|---------|
| **Progress** | � Active Development | Stable base with ongoing refinements and feature additions |
| **Purpose** | 🧪 Learning & Daily Use | Production-ready system with experimentation sandbox |
| **Goal** | 🎯 Module-Based Multi-Machine Setup | Achieved: Solid, personalized NixOS config ready for deployment |
| **Desktop** | 🖥️ Dual Environment | Niri (Wayland) + KDE (X11) with intelligent session management |
| **Deployment** | 🔍 Evaluating Options | Considering [nilla](https://github.com/nilla-nix/nilla), [colmena](https://github.com/zhaofengli/colmena) for multi-host |
| **Status** | ✅ Production Ready | Wayland-first setup, dual waybar, intelligent session management, comprehensive documentation |

</details>

---

## 📁 Directory Structure & Documentation

| Path | Description |
|------|-------------|
| **Core Configuration** | |
| `configuration.nix` | Main NixOS system configuration file |
| `hardware-configuration.nix` | Hardware-specific settings (auto-generated) |
| `pinning.nix` | Package pinning and version management |
| **Modular Components** | |
| `hosts/` | Per-machine configurations. See [Hosts.md](hosts/Hosts.md) |
| `de/` | Desktop environments (Niri, KDE). See [DesktopEnviroments.md](de/DesktopEnviroments.md) |
| `modules/` | Reusable system modules. See [Modules.md](modules/Modules.md) |
| `modules/homemanager/` | Home-manager specific modules (theming, Firefox) |
| `users/` | User-specific configurations and settings |
| **External Dependencies** | |
| `npins/` | Pin definitions for reproducible builds. See [Npins.md](npins/Npins.md) |
| `pkgs/` | Custom package definitions and builds. See [pkgs.md](pkgs/pkgs.md) |
| **Dotfiles & Scripts** | |
| `Dot/` | User configuration files (waybar, niri, stasis, etc). See [Dot.md](Dot/Dot.md) |
| `scripts/` | Automation scripts (rebuild, formatting, cleanup) |
| **Development** | |
| `.vscode/` | VS Code workspace settings for NixOS development |
| **Documentation** | |
| `changelog.asciidoc` | Full version history and change tracking |
| `CurrentIssues.md` | Active issues and troubleshooting guide |

---

## 📋 Changelog

See [changelog.asciidoc](changelog.asciidoc) for full versioned history (additions: niri environment, cleaning module, expanded pins, companion tooling, taskbar, deployment prep).

---

## 🐞 Current Issues

See [CurrentIssues.md](CurrentIssues.md) for the latest tracked issues and desktop environment troubleshooting.

---

## 🚀 Roadmap & Recent Additions

### ✅ Recently Completed

- [x] **Module Organization**: Comprehensive restructuring with `modules/homemanager/` for user configs
- [x] **Wayland Environment**: Separated Wayland configuration into dedicated `modules/wayland.nix`
- [x] **Desktop Services**: Consolidated system services in `modules/desktop-services.nix`
- [x] **Security Enhancement**: Enhanced PAM configuration and polkit integration
- [x] **Firefox Theming**: LittleFox theme with Reversal-Dark color scheme integration
- [x] **File Manager**: Replaced Dolphin with Nautilus for better GTK integration
- [x] **Documentation**: Updated all .md files and cleaned up unnecessary comments

### 🔮 Short-term Goals

- [ ] **Security Enhancement**: Evaluate agenix or sops-nix for secrets management
- [ ] **Cleanup**: Remove deprecated lxqtniri session configuration
- [ ] **Deployment**: Test nilla or colmena for multi-host management
- [ ] **Performance**: Consider mako notification daemon for lighter resource usage
- [ ] **Input Methods**: Explore fcitx5 or ibus for multilingual support
- [ ] **Audio**: Fine-tune PipeWire configuration and add audio effects
- [ ] **Theming**: Create consistent theme across all applications
- [ ] **Backup**: Enhance backup module with cloud storage integration

### 🎯 Long-term Vision

- [ ] **Multi-Host Deployment**: Deploy configuration across all devices (Earth, Mercury, Moon, Star)
- [ ] **Container Integration**: Add Podman/Docker development containers
- [ ] **Home Lab**: Integrate with self-hosted services and infrastructure
- [ ] **CI/CD Pipeline**: Automated configuration testing and deployment
- [ ] **Documentation**: Create comprehensive setup guides and tutorials
- [ ] **Community**: Share modules and configurations with NixOS community
- [ ] **Optimization**: Profile and optimize system performance metrics
- [ ] **Security Hardening**: Implement zero-trust security model

---

## 📝 Configuration Notes

<details>
<summary><strong>Display & Graphics</strong></summary>

**Wayland Primary:** Successfully transitioned to Wayland (Niri) as primary desktop environment. X11 applications run through xwayland-satellite for compatibility. NVIDIA performance issues resolved with proper driver configuration.

**Display Setup:** Dual environment approach - Niri for daily use, KDE available for X11-specific workflows when needed.

</details>

<details>
<summary><strong>Security & Secrets</strong></summary>

**Security Overhaul (WIP):** Currently implementing enhanced security measures through the security module. Basic hardening in place with firewall, fail2ban, and AppArmor.

**Secrets Management:** Work in progress - evaluating best practices for NixOS secret management. No agenix or sops implementation yet, focusing on proper module isolation and system hardening first.

**Authentication:** Soteria polkit agent integrated for secure privilege escalation in Wayland sessions.

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
| `modules/homemanager/` | ✅ Active | Firefox theming, GTK configuration, user-level configs |
| `modules/wayland.nix` | ✅ Active | Wayland environment variables and XDG portals |
| `modules/desktop-services.nix` | ✅ Active | System services for desktop integration |
| `Dot/` configurations | ✅ Active | Waybar, niri, stasis configs with dual bar setup |
| `pkgs/` custom builds | ✅ Active | Niri ecosystem packages and stasis session manager |
| `users/` profiles | ✅ Active | User-specific configurations and settings |
| `de/lxqtniri.nix` | ⚠️ Deprecated | Retained for reference (pending removal) |

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
