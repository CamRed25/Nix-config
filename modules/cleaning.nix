{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.xdg-ninja
    pkgs.bleachbit
  ];
}
