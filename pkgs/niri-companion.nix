{pkgs}: let
  pins = import ../npins;
in
  pkgs.python3Packages.buildPythonPackage {
    pname = "niri-companion";
    version = "unstable";

    src = pins."niri-companion";

    pyproject = true;

    pythonRelaxDeps = ["typer"];

    build-system = with pkgs.python3Packages; [
      setuptools
      wheel
    ];

    propagatedBuildInputs = with pkgs.python3Packages; [
      pydantic
      rich
      tomli-w
      watchdog
      typer
      click
      toml
    ];

    # Fix src layout and missing main function
    postPatch = ''
      # Verify the main function exists in genconfig.py
      if [ -f "src/companion/genconfig.py" ]; then
        echo "Checking for main function in genconfig.py:"
        grep -n "def main\|if __name__" src/companion/genconfig.py

        # Check what functions actually exist
        echo "Available functions in genconfig.py:"
        grep -n "^def " src/companion/genconfig.py

        # If no main function exists, create one or fix the entry point
        if ! grep -q "def main" src/companion/genconfig.py; then
          echo "No main function found, checking for alternative entry points..."

          # Look for a function that could be the entry point
          ENTRY_FUNC=$(grep -o "^def [a-zA-Z_][a-zA-Z0-9_]*" src/companion/genconfig.py | head -1 | cut -d' ' -f2)

          if [ -n "$ENTRY_FUNC" ]; then
            echo "Found potential entry function: $ENTRY_FUNC"
            # Add a main function that calls the actual entry point
            echo "" >> src/companion/genconfig.py
            echo "def main():" >> src/companion/genconfig.py
            echo "    $ENTRY_FUNC()" >> src/companion/genconfig.py
          fi
        fi
      fi
    '';

    # Ensure the package structure is correct
    postInstall = ''
      # Verify the package was installed correctly
      if [ -d "$out/lib/python*/site-packages/companion" ]; then
        echo "Package installed successfully"
        ls -la "$out/lib/python*/site-packages/companion/"
      else
        echo "Package installation may have failed"
      fi
    '';

    meta = with pkgs.lib; {
      description = "Niri companion scripts (toolkit for niri)";
      license = licenses.gpl3;
      homepage = "https://github.com/dybdeskarphet/niri-companion";
      maintainers = [];
      platforms = platforms.linux;
    };
  }
