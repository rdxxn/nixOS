{ pkgs, username, ... }:
{
  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;

  home-manager.users.${username}.programs.fish = {
    enable = true;

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
      vencord = {
        description = "installs Vencord";
        body = ''sh -c "$(curl -sS https://vencord.dev/install.sh)" -- $argv'';
      };
    };
  };
}
