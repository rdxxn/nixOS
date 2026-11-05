{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    #../../modules/features/system/snapshots.nix
  ];

  # allows updating device firmware included uefi
  services.fwupd.enable = true;

  # prevents overheating (intel only)
  services.thermald.enable = true;

  # tlp for battery life. It conflicts with power-profiles-daemon and tuned, so neither is enabled.
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # handles closing the lid
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  system.stateVersion = "26.05";
  
  boot.zswap = {
    enable = true;
    zpool = "zsmalloc";
    maxPoolPercent = 25;
    shrinkerEnabled = true;
    compressor = "lz4"; # fastest compression with lowest latency (im not expecting to do too much ram intensive stuff)
    acceptThresholdPercent = 90;
  };
  
  # needed for lz4
  boot.initrd.systemd.enable = true;
}
