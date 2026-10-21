{ pkgs, username, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [ ]; # none of the defaults (foot, swaylock, wmenu...) because noctalia + kitty has all dat stuffs
  };

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
  ];
}
