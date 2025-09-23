{
  lib,
  rustPlatform,
  pkg-config,
  systemd,
}: let
  pins = import ../npins;
in
  rustPlatform.buildRustPackage rec {
    pname = "niri-tag";
    version = "0.1.1";

    src = pins.niri-tag;

    cargoLock = {
      lockFile = "${src}/Cargo.lock";
    };

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      systemd
    ];

    # Build all binaries
    cargoBuildFlags = ["--bins"];

    meta = with lib; {
      description = "Tag-based window management for the Niri compositor";
      homepage = "https://git.atagen.co/atagen/niri-tag";
      license = licenses.eupl12;
      maintainers = [];
      platforms = platforms.linux;
    };
  }
