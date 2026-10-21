{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    packages = [
      "com.discordapp.Discord"
      "com.stremio.Stremio"
      "com.github.tchx84.Flatseal"
    ];

    overrides.global = {
      Context.filesystems = [
        "~/.themes"
        "/nix/store:ro" # theme files are symlinks into the store
      ];

      Environment.GTK_THEME = "Catppuccin-Mocha-Standard-Red-dark";
    };
  };
}
