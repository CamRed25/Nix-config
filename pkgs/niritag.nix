{pkgs}:
with pkgs;
  rustPlatform.buildRustPackage rec {
    pname = "niri-tag";
    version = "0.1.1";

    src = (import ../npins).niri-tag;

    cargoLock = {
      lockFile = "${src}/Cargo.lock";
    };

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      systemd
    ];

    # Copy niri source into build directory as required by niri-tag
    preBuild = ''
      cp -R ${niri.src} niri/
      chmod -R +w niri/
    '';

    meta = with lib; {
      description = "Tag-based window management for the Niri compositor";
      homepage = "https://git.atagen.co/atagen/niri-tag";
      license = licenses.eupl12;
      maintainers = [];
      mainProgram = "niri-tag";
      platforms = platforms.linux;
    };
  }
