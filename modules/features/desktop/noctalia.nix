{
  inputs,
  pkgs,
  username,
  ...
}:
{
  services.upower.enable = true;
  # power profiles are per host (PPD on the desktop, tlp on the laptop)

  home-manager.users.${username}.home.packages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
