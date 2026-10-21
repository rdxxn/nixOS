# Features append names to nixpkgs.allowedUnfreePackages; one predicate checks them.
# Several modules each setting allowUnfreePredicate would conflict.
{ config, lib, ... }:
{
  options.nixpkgs.allowedUnfreePackages = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Names of unfree packages this system may use.";
  };

  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.nixpkgs.allowedUnfreePackages;
}
