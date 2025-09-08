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
      ];
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowUnsupportedSystem = false;
    allowInsecure = false;
    allowPrivilegedProgram = false;
  };
}
