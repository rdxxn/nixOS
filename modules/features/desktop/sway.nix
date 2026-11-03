{ pkgs, username, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [ ]; # none of the defaults (foot, swaylock, wmenu...) because noctalia + kitty has all dat stuffs
  };
}
