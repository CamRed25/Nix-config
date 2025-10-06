{
  # Time zone configuration
  time.timeZone = "America/Chicago";

  # Time synchronization service
  services.timesyncd.enable = true;

  # Locale configuration
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Console and input configuration
  console = {
    useXkbConfig = true; # Use X11 keymap for console (automatically sets keyMap)
  };

  # Services for proper input handling
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "";
  };
}
