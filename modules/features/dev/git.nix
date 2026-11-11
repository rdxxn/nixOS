{ username, ... }:
{
  # SSH/PGP keys on hw key
  home-manager.users.${username}.programs = {
    git.enable = true;
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    programs.lazygit = {
      enable = true;
      settings = {
        gui.theme = {
          activeBorderColor = [ "#cba6f7" "bold" ];
          inactiveBorderColor = [ "#fab387" ];
          searchingActiveBorderColor = [ "#94e2d5" "bold" ];
          optionsTextColor = [ "#a3b4eb" ];
          selectedLineBgColor = [ "#3a3b50" ];
          inactiveViewSelectedLineBgColor = [ "bold" ];
          cherryPickedCommitFgColor = [ "#a3b4eb" ];
          cherryPickedCommitBgColor = [ "#94e2d5" ];
          markedBaseCommitFgColor = [ "#94e2d5" ];
          markedBaseCommitBgColor = [ "#f38ba8" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
        };
      };
    };
  };
}
