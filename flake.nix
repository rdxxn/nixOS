{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  # TODO - fix steam popups being in the middle of the screen and stealing focus in niri


  # TODO - FIX STYLIX OUTPUT
  stylix = {
    url = "github:nix-community/stylix/release-26.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "rdxxn";

      mkHost =
        name:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username; };
          modules = [
            ./modules
            ./hosts/${name}/configuration.nix
            { networking.hostName = name; }
          ];
        };
    in
    {
      nixosConfigurations = {
        mephistopholes = mkHost "mephistopholes";
      };

      devShells.${system} = import ./devshells.nix nixpkgs.legacyPackages.${system};
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
    };
}
