# ⚠️ pkgs folder: Experimental Build Area

**Warning:**
This folder is for compiling and building software in isolation.
It is intentionally messy and *should not* be used as a reference for main or production Nix configurations.

Use this area for testing, prototyping, and local builds only.

Currently, this folder contains experimental Nix expressions for the following projects:

| Package         | Description                                   | Repository Link                                               |
|-----------------|-----------------------------------------------|--------------------------------------------------------------|
| niri-companion  | Toolkit for the Niri compositor               | [GitHub](https://github.com/dybdeskarphet/niri-companion)    |
| niri-switch     | Related utility for Niri                      | [git.atagen.co](https://git.atagen.co/atagen/niri-switch)    |
| niri-tag        | Tag-based window management for Niri          | [git.atagen.co](https://git.atagen.co/atagen/niri-tag)       |

Each package is defined in its respective `.nix` file in this directory.
