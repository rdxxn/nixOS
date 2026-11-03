{ username, ... }:
{
  home-manager.users.${username}.programs.zellij = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      theme = "catppuccin-mocha";
      show_startup_tips = false;
    };

    # TODO - ENABLE TMUX MODE IN CONFIG 
  };
}
