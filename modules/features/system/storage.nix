{ config, lib, pkgs, ... }:
{
  services.fstrim.enable = true;
  services.btrfs.autoScrub.enable = true;
  # Installs btrfs assistant
  environment.systemPackages = [ pkgs.btrfs-assistant ];
  # Backs up ~/, storing up to 3 dailies and 2 weeklies and one monthly
  services.snapper.configs = {
    home = {
      SUBVOLUME = "/home";
      ALLOW_USERS = [ "rdxxn" ];
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
      TIMELINE_LIMIT_HOURLY = 0;
      TIMELINE_LIMIT_DAILY = 3;
      TIMELINE_LIMIT_WEEKLY = 2;
      TIMELINE_LIMIT_MONTHLY = 1;
      TIMELINE_LIMIT_YEARLY = 0;
    };
  };
}