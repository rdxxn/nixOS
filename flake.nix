{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-stable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-flatpak.url = "github:gmodena/nix-flatpak";

  outputs = {self, nixpkgs, home-manager, nix-flatpak} : {

  }
}