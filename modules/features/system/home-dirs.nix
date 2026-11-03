{ username, ... }:
{
  home-manager.users.${username} =
    { config, ... }:
    let
      home = config.home.homeDirectory;
    in
    {
      # ~/dots and ~/nixOS comes seperately 
      xdg.userDirs = {
        enable = true;
        createDirectories = true;

        # unused defaults
        desktop = null;
        music = null;
        templates = null;

        documents = "${home}/Documents";
        download = "${home}/Downloads";
        pictures = "${home}/Pictures";
        videos = "${home}/Videos";
        publicShare = "${home}/Public";
        projects = "${home}/Projects";

        # written to user-dirs.dirs as XDG_<NAME>_DIR and created too
        extraConfig = {
          SCREENSHOTS = "${home}/Screenshots";
          VAULT = "${home}/Vault";
          NOTES = "${home}/Notes";
        };
      };
    };
}
