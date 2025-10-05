# Desktop Environment Issue Tracker

Purpose: Track current DE issues and their relative priority.

## Priority Legend

- 🔴 P1: Blocks normal workflow
- 🟡 P2: Annoying but has workaround
- 🟢 P3: Nice to resolve / cosmetic

---

## KDE

- [ ] 🔴 P1 Wayland support: Investigate remaining blockers.
  - Notes: Confirm if all daily apps behave correctly under Wayland.
  - Next: List any apps still forcing XWayland.
  - Checking boot section. Possibly related to NVIDIA drivers in the kernel.

## Niri

- [ ] 🔴 P1 Wayland support: Validate parity with X11 workflow.
  - Force X11 apps to run under xwayland-satellite (or find alternatives).
  - Current workaround: switch to KDE X11 session for any X11-only apps.
- [x] 🟡 P2 Mysterious black floating window (unknown app): **RESOLVED**
  - Hypothesis was correct: related to systemd user session apps.
  - Solution: Proper service configuration and waybar setup resolved the issue.
- [x] 🟡 P2 Waybar not working: **RESOLVED**
  - Issue: Malformed nix configuration causing service failures.
  - Solution: Fixed escaped newlines in niri.nix and proper dual waybar setup implemented.

---

## Scratchpad / Follow-ups

Last updated: (10/5/2025)
