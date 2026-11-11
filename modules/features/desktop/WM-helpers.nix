{ pkgs, username, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  home-manager.users.${username}.home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    xdg-utils
    swappy
  ];
}