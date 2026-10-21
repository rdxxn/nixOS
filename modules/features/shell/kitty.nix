{ username, ... }:
{
  home-manager.users.${username}.programs.kitty = {
    enable = true;
    extraConfig = ''
      include current-theme.conf
    '';
  };
}
