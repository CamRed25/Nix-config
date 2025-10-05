# Pins

This folder contains the pin definitions used in my NixOS configuration.
Each pin refers to a specific version of a repository or channel, allowing for reproducible builds and easy updates.

---

## Current Pins

| Pin | Source | Notes |
|-----|--------|-------|
| nix-index-database | https://github.com/nix-community/nix-index-database | nix-locate DB |
| nixos-hardware | https://github.com/NixOS/nixos-hardware | HW profiles |
| nixpkgs (unstable) | https://github.com/NixOS/nixpkgs | Main package set |
| npins | https://github.com/andir/npins | Pin manager |
| nyx | https://github.com/chaotic-cx/nyx | Extra packages |
| Nilla-CLI | https://github.com/nilla-nix/cli | Deployment tooling |
| home-manager | https://github.com/nix-community/home-manager | May replace later |
| nilla | https://github.com/nilla-nix/nilla | Deployment core |
| nilla-utils | https://github.com/arnarg/nilla-utils | Helpers |
| nur-combined | https://github.com/nix-community/nur-combined | Community overlay |
| niri-companion | https://github.com/dybdeskarphet/niri-companion | Wayland helper |

---

## Future Pins & Alternatives

- Consider replacing **home-manager** with either:
  - [nix-maid](https://github.com/viperML/nix-maid), or
  - [hjem](https://github.com/feel-co/hjem).
- Explore other options for Nix deployment:
  - [nilla](https://github.com/nilla-nix/nilla), or
  - [colmena](https://github.com/zhaofengli/colmena).
