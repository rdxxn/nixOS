{ username, ... }:
{
  home-manager.users.${username}.programs.tealdeer = {
    enable = true;
    settings.updates.auto_update = true;
  };
}
