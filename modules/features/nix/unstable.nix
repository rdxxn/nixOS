{ config, inputs, ... }:
{
  # allows pkgs.unstable.package name for unstable package
  nixpkgs.overlays = [
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (config.nixpkgs) config;
      };
    })
  ];
}
