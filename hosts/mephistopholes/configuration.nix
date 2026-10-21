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

  # Hibernate 5 minutes after suspending when undocked and no external power
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "10min";
  };

  system.stateVersion = "26.05";

  # TODO - sway three finger swipe to swap workspaces
}
