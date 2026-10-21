# Exposes nixpkgs-unstable as pkgs.unstable, so every exception to "stable by default"
# is a grep for `pkgs.unstable`.
{ config, inputs, ... }:
{
  nixpkgs.overlays = [
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (config.nixpkgs) config;
      };
    })
  ];
}
