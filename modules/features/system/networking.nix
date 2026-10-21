{ username, ... }:
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  users.users.${username}.extraGroups = [ "networkmanager" ];
}
