{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = [ pkgs.proton-vpn ];

  # stops legit wireguard traffic that networkmanager routes
  networking.firewall.checkReversePath = "loose";
}
