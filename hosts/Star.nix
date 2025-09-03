# Desktop configuration for Star
{
  config,
  pkgs,
  ...
}: {
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
      # "nvidia_drm.fbdev=1"
      # "nvidia.NVreg_EnableGpuFirmware=0"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    loader = {
      systemd-boot.enable = true;
      timeout = 3;
      efi.canTouchEfiVariables = true;
    };
    blacklistedKernelModules = ["nouveau"];
    tmp.cleanOnBoot = true;
  };
}
