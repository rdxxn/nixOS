{ username, ...}:
{
  home-manager.users.${username}.programs.localsend.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };
}