{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.udisks2.enable = true; # system service to manage disks and removable storage - kinda redundant but harmless
  services.tumbler.enable = true; # Thumbnail support for images
  environment.systemPackages = [ pkgs.file-roller ];
}