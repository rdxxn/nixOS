{ config, lib, pkgs, ... }:
{
  services.printing.enable = true;
  # enables network detection of printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  # maybe needed later
  # https://nixos.wiki/wiki/Printing
  #services.printing.drivers = [ YOUR_DRIVER ];
}