# TODO plugins: check their dependencies (lazygit et al) are installed somewhere
{ pkgs, username, ... }:
{
  home-manager.users.${username}.programs.yazi = {
    enable = true;
    package = pkgs.unstable.yazi;
  };
}
