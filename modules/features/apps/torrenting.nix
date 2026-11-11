{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = [ pkgs.qbittorrent ];

  networking.firewall = {
    allowedTCPPorts = [ 6881 ]; # Actually need to double check
    allowedUDPPorts = [ 6881 ];
  };
}