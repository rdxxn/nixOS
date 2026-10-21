{ username, ... }:
{
  home-manager.users.${username}.programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    eza.enable = true;
    bat.enable = true;
    jq.enable = true;
  };
}
