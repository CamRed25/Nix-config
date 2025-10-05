# Documentation: https://github.com/dybdeskarphet/niri-companion
# GUI application for niri compositor settings and control
# Usage: niri-companion --help
#
# IMPORTANT: With niri-genconfig daemon running, any niri configuration
# changes should be made in the modular source files at:
# ~/.config/niri/sources/*.kdl
#
# These will be automatically merged into config.kdl by the daemon.
# Do NOT edit ~/.config/niri/config.kdl directly when using niri-genconfig!
{
  lib,
  python313,
  fetchPypi,
}: let
  # Create custom typer package with the required version
  typer-new = python313.pkgs.typer.overridePythonAttrs (old: rec {
    version = "0.19.1";
    src = fetchPypi {
      inherit version;
      pname = "typer";
      hash = "sha256-y4gUM6SxXazIdbsFg9GmHnhJeAZ0H5q6eSq8qzkMA+Y=";
    };
  });
in
  python313.pkgs.buildPythonApplication {
    pname = "niri-companion";
    version = "2.3.0";

    src = (import ../npins).niri-companion;

    format = "pyproject";

    nativeBuildInputs = with python313.pkgs; [
      setuptools
    ];

    propagatedBuildInputs = with python313.pkgs; [
      pydantic
      rich
      tomli-w
      typer-new # Use our overridden version
      watchdog
    ];

    checkInputs = with python313.pkgs; [
      pytest
      pytest-cov
    ];

    meta = with lib; {
      description = "Niri companion scripts";
      homepage = "https://github.com/dybdeskarphet/niri-companion";
      license = licenses.gpl3Plus;
      maintainers = [];
      mainProgram = "niri-companion";
    };
  }
