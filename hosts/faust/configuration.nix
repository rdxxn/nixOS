{ ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/features/gaming
    ../../modules/features/dev/ai.nix
    #../../modules/features/system/snapshots.nix
  ];

  # desktop: no tlp/thermald/lid handling, plain power-profiles-daemon
  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;

  system.stateVersion = "26.05";

  # memory compression (not swap)
  zramSwap {
    enable = true;
    memoryPercent = 25;
    algorithm = "zstd";
  }

}
