{ pkgs, ... }:
{
  # capSysNice - gives it certain scheduling perms
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    localNetworkGameTransfers.openFirewall = true;
  };
  # Possible solution if things start failing
  #networking.firewall.allowedTCPPortRanges = [ { from = 27015; to = 27050; } ];

  environment.systemPackages = [ pkgs.vulkan-tools ];

  nixpkgs.allowedUnfreePackages = [
    "steam"
    "steam-unwrapped"
    "steam-original"
    "steam-run"
  ];
}
