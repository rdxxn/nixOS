{ pkgs, username, ... }:
{
  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;

  home-manager.users.${username}.programs.fish = {
    enable = true;

    plugins = [
      {
        name = "bass"; # Runs bash commands by prefixing with bass
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "done"; # notif when long command finishes
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "bang-bang"; # bash-style !! and !$ history expansion
        src = pkgs.fishPlugins.bang-bang.src;
      }
      {
        name = "sponge"; # removes mistyped commands from history
        src = pkgs.fishPlugins.sponge.src;
      }
    ];

    # allows it from dots with home manager
    shellInit = ''
      if test -r ~/dots/fish/config.fish
        source ~/dots/fish/config.fish
      end
    '';

    # TODO - Add others
    functions = {
      bios = {
        description = "alias bios=sudo systemctl reboot --firmware-setup";
        wraps = "sudo systemctl reboot --firmware-setup";
        body = "sudo systemctl reboot --firmware-setup $argv";
      };

      # nh reads NH_FLAKE (nix/tooling.nix), so these work from any directory
      rebuild = {
        description = "build and switch to the new system config";
        body = "nh os switch $argv";
      };
      build = {
        description = "build the system config without activating it";
        body = "nh os build $argv";
      };
      vm = {
        description = "build this host's config as a VM and boot it (safe place to test changes)";
        body = ''
          set -l host (hostname)
          pushd (mktemp -d)
          nixos-rebuild build-vm --flake ~/NixOS#$host $argv
          and ./result/bin/run-$host-vm
          popd
        '';
      };

      fsync = {
        description = "mirror SRC into DEST with progress (SRC/ = its contents, SRC = the folder itself)";
        body = "rsync -ah --info=progress2 --partial $argv";
      };
    };
  };
}
