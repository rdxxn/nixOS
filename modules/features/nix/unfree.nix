{ config, lib, ... }:
{
  # Makes a new option to allow unfree packages
  options.nixpkgs.allowedUnfreePackages = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Names of unfree packages this system may use.";
  };

  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.nixpkgs.allowedUnfreePackages;
}
