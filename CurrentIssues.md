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
- [ ] 🟡 P2 Mysterious black floating window (unknown app):
  - Hypothesis: possibly has something to do with current apps being opened in the systemd user session. my guesses are on niri-genconfig-daemon.service or swaybg.service.
  - workaround get binding in niri for Alt + Q to quit the app.
- [ ] currently waybar isnt working. need to investigate. neither base or custom bar is showing.
  - Hypothesis: possibly systemd user session issue? error in configs of waybar?

---

## Scratchpad / Follow-ups

Last updated: (9/24/2025)
