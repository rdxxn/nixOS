{ inputs, pkgs, username, ...}:
{
  imports = [ inputs.nix-index-database.nixosModules.nix-index ];

  programs.nh = {
    enable = true;
    flake = "/home/${username}/NixOS";
    # replaces nix.gc (removed from settings.nix, the two would fight)
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 30d --keep 5";
    };
  };

  programs.nix-index-database = {
    enable = true;
    comma.enable = true;
  };
  programs.command-not-found.enable = false;

  home-manager.users.${username}.home.packages = with pkgs; [
    nix-output-monitor
    statix
    deadnix
    just
  ];

# Commands (fish functions in shell/fish.nix, repo jobs in ./justfile)
#   rebuild / build / vm       nh os switch / nh os build / boot config as a VM
#   nh os test                 activate without making it the boot default
#   nh os switch --update      update flake inputs, then rebuild
#   nh clean all               prune old generations (also weekly, see below)
#   , <cmd>                    run a program without installing it (comma)
#   nix-locate <file>          which package provides this file or command
#   just fmt|lint|check|update nix fmt | statix + deadnix | dry-build | flake update
#   sudo nixos-rebuild switch --rollback   undo the last switch
#
# nh finds the flake via NH_FLAKE, so these work from any directory.
}