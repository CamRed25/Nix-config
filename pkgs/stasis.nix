# Documentation: https://github.com/Magicow7/stasis
# Config location: ~/.config/stasis/
# Man page: man 5 stasis
{pkgs ? import <nixpkgs> {}}:
with pkgs;
  rustPlatform.buildRustPackage rec {
    pname = "stasis";
    version = "0.1.48";

    src = (import ../npins).stasis;

    cargoLock = {
      lockFile = src + "/Cargo.lock";
      outputHashes = {}; # Will be filled automatically if needed
    };

    # Disable tests since they're trying to access files that don't exist in the build sandbox
    doCheck = false;

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = [
      wayland
      wayland-protocols
      libxkbcommon
      libinput
      dbus
      udev
      xorg.libX11
    ];

    # Remove the setSourceRoot section since we now know the structure
    # Instead, add postInstall to handle the additional files
    postInstall = ''
      # Install man page
      mkdir -p $out/share/man/man5
      cp -v man/stasis.5 $out/share/man/man5/

      # Install example configuration
      mkdir -p $out/share/stasis/examples
      cp -v examples/stasis.rune $out/share/stasis/examples/

      # Install assets
      mkdir -p $out/share/stasis/assets
      cp -v assets/stasis.png $out/share/stasis/assets/
    '';

    meta = with lib; {
      description = "A system monitoring and management utility for Linux";
      homepage = "https://github.com/stasis-project/stasis";
      license = licenses.mit;
      platforms = platforms.linux;
      maintainers = [];
    };
  }
