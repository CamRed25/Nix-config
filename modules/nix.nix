_: {
  nix = {
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      keep-going = false; # maybe not yet.
      sandbox = true;
      use-cgroups = true;
      max-jobs = "auto";
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
