{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    protontricks
    vulkan-tools
    mangohud
    govulkaninfo          # if available; else vulkan-tools is enough
  ];

  services.flatpak.packages = [ "com.vysp3r.ProtonPlus" ];

  home-manager.users.${username}.home.packages = with pkgs; [
    bottles
  ];
}