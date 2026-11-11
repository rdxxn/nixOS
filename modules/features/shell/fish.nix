{ pkgs, username, ... }:
{
  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;

  home-manager.users.${username}.programs.fish = {
    enable = true;

    plugins = [
      # Runs bash commands by prefixing with bass
      { name = "bass"; src = pkgs.fishPlugins.bass.src; }
      # notif when long command finishes
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      # bash-style !! and !$ history expansion
      { name = "bang-bang"; src = pkgs.fishPlugins.bang-bang.src; }
      # removes mistyped commands from history
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    ];

    interactiveShellInit = ''
      set fish_greeting ""
    '';

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

      mirror = {
        description = "mirror SRC to DEST, only copying changes (SRC/ = contents, SRC = folder)";
        body = "rsync -ah --info=progress2 --partial --delete $argv && sync";
      };

      flatseal = {
        description = "alias flatseal=flatpak run com.github.tchx84.Flatseal";
        wraps = "flatpak run com.github.tchx84.Flatseal";
        body = "flatpak run com.github.tchx84.Flatseal $argv";
      };

      fzfcd = {
        description = "fzf picker that cds into the selected dir (or its parent if a file)";
        body = ''
          set -l selected (fzf --preview 'if test -d {}; ls -la {}; else; bat --color=always {}; end')
          if test -n "$selected"
            if test -d "$selected"
              cd "$selected"
            else
              cd (dirname -- "$selected")
            end
          end
        '';
      };

      fzfnvim = {
        description = "fzf + nvim";
        body = ''
          set -l file (fzf --preview 'bat --color=always {}')
          if test -n "$file"
            nvim "$file"
          end
        '';
      };

      fzfvim = {
        description = "fzf + vim";
        body = ''
          set -l file (fzf --preview 'bat --color=always {}')
          if test -n "$file"
            vim "$file"
          end
        '';
      };

      mpv-tracker = {
        description = "alias mpv-tracker=~/.local/bin/mpv-tracker";
        wraps = "~/.local/bin/mpv-tracker";
        body = "~/.local/bin/mpv-tracker $argv";
      };

      sudofzfnvim = {
        description = "fzf + sudo nvim";
        body = ''
          set -l file (fzf --preview 'bat --color=always {}')
          if test -n "$file"
            sudo nvim "$file"
          end
        '';
      };

      sudofzfvim = {
        description = "fzf + sudo vim";
        body = ''
          set -l file (fzf --preview 'bat --color=always {}')
          if test -n "$file"
            sudo vim "$file"
          end
        '';
      };

    };
  };
}
