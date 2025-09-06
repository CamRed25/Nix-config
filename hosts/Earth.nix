# TouchScreen
{pkgs, ...}: let
  pins = import ../npins;
  ware = import pins.nixos-hardware {inherit pkgs;};
in {
  imports = [
    ware.microsoft.surface.go
  ];

  hardware.microsoft-surface.kernelVersion = "stable";
}
