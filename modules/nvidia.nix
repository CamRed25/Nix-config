{
  pkgs,
  config,
  lib,
  ...
}: {
  hardware = {
    # === Graphics Settings ===
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        nvidia-vaapi-driver
        libvdpau-va-gl
        vulkan-loader
        vulkan-validation-layers
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva
        nvidia-vaapi-driver
        libvdpau-va-gl
      ];
    };
    # === NVIDIA Settings ===
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
    };
  };
}
