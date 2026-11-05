{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubikey-personalization
    yubico-piv-tool
    yubico-pam
    libfido2
    pam_u2f
    gnupg
    opensc
    pcsc-tools
  ];

  # sets udev device manager rules for yubikey
  services.udev.packages = [
    pkgs.yubikey-personalization
  ];

  # Smart-card stuff daemon
  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}