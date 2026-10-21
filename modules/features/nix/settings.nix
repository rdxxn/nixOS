{ inputs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # slows builds down a bit to save disk
      auto-optimise-store = true;
    };

    # garbage colelction
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # keeps nixpkgs and unstable aliases pinned to their respective flake inputs
    # also makes legacy <nixpkgs> lookups use the system's nixpkgs registry entry
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      unstable.flake = inputs.nixpkgs-unstable;
    };
    nixPath = [ "nixpkgs=flake:nixpkgs" ];
  };
}
