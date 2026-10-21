{ pkgs, ... }:
{
  programs.steam.enable = true;

  # capSysNice - gives it certain scheduling perms
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  environment.systemPackages = [ pkgs.vulkan-tools ];

  nixpkgs.allowedUnfreePackages = [
    "steam"
    "steam-unwrapped"
    "steam-original"
    "steam-run"
  ];
}
