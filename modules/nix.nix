_: {
  nix = {
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      allowed-users = [
        "root"
        "cam"
      ];
      trusted-users = [
        "root"
        "cam"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "recursive-nix"
      ];

      # Performance optimizations
      max-jobs = "auto";
      cores = 0; # Use all available cores

      # Build isolation and security
      sandbox = true;

      # Keep build logs for debugging
      keep-outputs = false;
      keep-derivations = false;

      # Warn about dirty Git repos
      warn-dirty = true;
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowUnsupportedSystem = false;
    allowInsecure = false;
    allowPrivilegedProgram = false;
    system = "x86_64-linux"; # Specify the system platform
  };
}
