# Documentation: https://github.com/MTeaHead/niri-session-manager
# Config location: ~/.config/niri-session-manager/
# Usage: Automatically saves/restores window layouts
{pkgs}:
with pkgs;
  rustPlatform.buildRustPackage rec {
    pname = "niri-session-manager";
    version = "0.2.0";

    src = (import ../npins).niri-session-manager;

    cargoLock = {
      lockFile = "${src}/Cargo.lock";
    };

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      # Add any system dependencies if needed
    ];

    meta = with lib; {
      description = "Session manager for the Niri Wayland compositor that automatically saves and restores window layout";
      homepage = "https://github.com/MTeaHead/niri-session-manager";
      license = licenses.mit;
      maintainers = [];
      mainProgram = "niri-session-manager";
      platforms = platforms.linux;
    };
  }
