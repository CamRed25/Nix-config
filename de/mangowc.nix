{
  config,
  lib,
  pkgs,
  ...
}: let
  pins = import ../npins;
  mangowcPath = pins.mangowc;
  inherit (pins) mmsg;
  packages = {
    ${pkgs.system} = pkgs // {mango = pkgs.callPackage "${mangowcPath}/nix/default.nix" {inherit mmsg;};};
  };
  mangoModule = import "${mangowcPath}/nix/nixos-modules.nix";
in {
  imports = [(mangoModule {inherit config lib pkgs packages;})];

  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    walker
    ghostty
  ];
}
