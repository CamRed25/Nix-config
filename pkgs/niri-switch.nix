# Documentation: https://github.com/Kiki-Bouba-Team/niri-switch
# Usage: Alt+Tab keybind configured in niri config, runs niri-switch-daemon service
# Service: systemctl --user status niri-switch-daemon.service
{pkgs}:
with pkgs;
  rustPlatform.buildRustPackage rec {
    pname = "niri-switch";
    version = "0.1.0";

    src = (import ../npins).niri-switch;

    cargoLock = {
      lockFile = "${src}/Cargo.lock";
    };

    nativeBuildInputs = [
      pkg-config
      wrapGAppsHook4
    ];

    buildInputs = [
      gtk4
      gtk4-layer-shell
    ];

    meta = with lib; {
      description = "A fast task switcher for niri compositor, similar to Alt-Tab";
      homepage = "https://github.com/Kiki-Bouba-Team/niri-switch";
      license = licenses.mit;
      maintainers = [];
      mainProgram = "niri-switch";
      platforms = platforms.linux;
    };
  }
