#pinning.nix
{pkgs, ...}: let
  pins = import ./npins;
  nix-index-database-pkgs = import pins.nix-index-database {
    inherit pkgs;
  };
in {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nix-locate-pinned" ''
      export NIX_PATH="nixpkgs=${pkgs.path}:nix-index-database=${nix-index-database-pkgs.nix-index-database.outPath}"
      ${pkgs.nix-index}/bin/nix-locate "$@"
    '')
  ];

  nixpkgs.flake.source = pins.nixpkgs;
}
