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

  # memory compression (not swap)
  zramSwap = {
    enable = true;
    memoryPercent = 25;
    algorithm = "zstd";
  }
  # "Because zram acts as a block device with a hard capacity limit in RAM,
  # the kernel's native OOM killer can sometimes fail to trigger in time under heavy memory pressure,
  # leading to severe system lockups" - NixOS wiki
  systemd.oomd.enable = true;
}
