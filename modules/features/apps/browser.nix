{ username, ... }:
{
  home-manager.users.${username}.programs.librewolf.enable = true;

  # TODO - add browser configging to dots
}
