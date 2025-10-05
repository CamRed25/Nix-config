# Desktop configuration for Star
{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm" # NVIDIA driver
    ];
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.disable_gsp=1"
      # "nvidia_drm.fbdev=1"           # Uncomment if you need framebuffer console
      # "nvidia.NVreg_EnableGpuFirmware=0"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Uncomment for better suspend/resume
    ];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false; # Disable boot entry editing for security
      };
      timeout = 3;
      efi.canTouchEfiVariables = true;
    };
    blacklistedKernelModules = ["nouveau"];
    tmp = {
      cleanOnBoot = true;
      useTmpfs = true; # Mount /tmp in RAM for better security and performance
    };
  };

  # Hardware-specific optimizations
  hardware.enableRedistributableFirmware = true;

  # Power management for desktop
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance"; # Desktop optimization
  };
}
