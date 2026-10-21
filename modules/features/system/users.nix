# Set passwd during install
{ username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
