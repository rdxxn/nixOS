{ pkgs, ... }:
{
  programs.niri.enable = true;

  # Niri uses this for x11 apps
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
