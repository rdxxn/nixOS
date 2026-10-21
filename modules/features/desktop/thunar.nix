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

  services.gvfs.enable = true; # mount, trash and other functionalities
  services.udisks2.enable = true; # disks and removable storage sys service
  services.tumbler.enable = true; # image thumbnails

  environment.systemPackages = [ pkgs.file-roller ];
}
