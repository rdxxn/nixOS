{ config, pkgs, ... }:

{
  imports = [
    #./hardware-configuration.nix

    #../../modules/base.nix
    #../../modules/desktop.nix
    #../../modules/networking.nix
    #../../modules/audio.nix
    #../../modules/development.nix
  ];

  # -------------------------
  # Machine-specific configuration
  # -------------------------

  networking.hostName = "mephistopholes";

  # allows updating device firmware including uefi
  services.fwupd.enable = true;

  hardware.graphics.enable = true;

  # Prevents overheating (intel only)
  services.thermald.enable = true;

  # Power management
  services.tlp.enable = true;
  services.tuned.enable = true;

  # Handles closing the laptop lid
    services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  # -------------------------
  # Boot
  # -------------------------

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # -------------------------
  # Nix
  # -------------------------

  # Optimise store on each build (slows it down a bit)
  nix.settings.auto-optimise-store = true;

  # -------------------------
  # State version
  # -------------------------

  system.stateVersion = "26.05";
}