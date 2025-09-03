{pkgs, ...}: {
  users.users.cam = {
    isNormalUser = true;
    description = "cam";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
      "lp"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [fish];
  };
}
