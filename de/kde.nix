_: {
  services = {
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      xkb = {
        layout = "us";
      };
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
