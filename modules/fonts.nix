# fonts.nix
# System-wide font configuration
{pkgs, ...}: {
  # Font configuration for better desktop experience
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      # Core fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      dejavu_fonts

      # Programming and terminal fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      fira-code
      fira-code-symbols

      # Microsoft fonts for compatibility (unfree)
      corefonts # Arial, Times New Roman, etc.
      vistafonts # Consolas, Calibri, etc.
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };

      defaultFonts = {
        serif = ["Noto Serif" "Liberation Serif"];
        sansSerif = ["Noto Sans" "Liberation Sans"];
        monospace = ["JetBrainsMono Nerd Font" "Liberation Mono"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
