# multimedia.nix
# Multimedia codec and media support configuration
{pkgs, ...}: {
  # Hardware acceleration support
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # For 32-bit applications

    # Additional graphics packages
    extraPackages = with pkgs; [
      # VAAPI (Video Acceleration API)
      intel-media-driver # For newer Intel GPUs (Broadwell+)
      intel-vaapi-driver # For older Intel GPUs
      libvdpau-va-gl # VDPAU driver for Intel/AMD

      # NVIDIA VDPAU (already have NVIDIA drivers in nvidia.nix)
      vaapiVdpau
      libva

      # Mesa drivers for AMD/Intel
      mesa
    ];
  };

  # PipeWire configuration enhancement for multimedia
  services.pipewire = {
    # Already enabled in configuration.nix, but ensuring media session
    wireplumber.enable = true;

    # Low-latency audio configuration
    extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 8192;
        };
      };
    };
  };

  # Multimedia packages
  environment.systemPackages = with pkgs; [
    # Core multimedia framework
    ffmpeg-full # Complete FFmpeg with all codecs
    gst_all_1.gstreamer # Multimedia framework

    # GStreamer plugins (essential for media playback)
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly # Contains MP3 and other proprietary codecs
    gst_all_1.gst-libav # FFmpeg integration
    gst_all_1.gst-vaapi # Hardware acceleration

    # Video players
    mpv # Lightweight, powerful video player
    vlc # Feature-rich media player
    celluloid # GTK frontend for mpv

    # Audio players and tools
    pavucontrol # PulseAudio/PipeWire volume control
    playerctl # Media player control utility

    # Image viewers and basic editing
    feh # Fast image viewer
    imv # Wayland-native image viewer
    gimp # Advanced image editor

    # Document viewers
    evince # GNOME document viewer
    kdePackages.okular # KDE document viewer
    zathura # Minimalist document viewer

    # Video editing and creation
    kdePackages.kdenlive # Professional video editor

    # Audio editing
    audacity # Audio editor and recorder

    # Screen recording and streaming
    obs-studio # Already enabled in gaming.nix as program

    # Codec libraries and tools
    libva-utils # VAAPI utilities
    vdpauinfo # VDPAU information tool

    # Archive and compression support
    p7zip # 7-Zip archiver
    unzip # ZIP extraction
    zip # ZIP creation
    rar # RAR support
    unrar # RAR extraction

    # Thumbnail generation
    ffmpegthumbnailer # Video thumbnails

    # Additional multimedia utilities
    mediainfo # Media file information
    exiftool # Metadata manipulation

    # Font rendering improvement
    fontconfig # Font configuration
    freetype # Font rendering

    # Color management
    colord # Color management daemon
  ];

  # Ensure proper permissions for media devices
  users.users.cam.extraGroups = [
    "audio" # Already in cam.nix
    "video" # Already in cam.nix
    "render" # For hardware acceleration
  ];

  # XDG MIME types for better file associations
  xdg.mime = {
    enable = true;

    # Custom MIME type associations can be added here
    addedAssociations = {
      "video/mp4" = ["mpv.desktop"];
      "video/x-matroska" = ["mpv.desktop"];
      "audio/mpeg" = ["mpv.desktop"];
      "audio/flac" = ["mpv.desktop"];
      "image/jpeg" = ["imv.desktop"];
      "image/png" = ["imv.desktop"];
      "application/pdf" = ["org.gnome.Evince.desktop"];
    };
  };
}
