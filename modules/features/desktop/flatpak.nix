{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    packages = [
      "dev.vencord.Vesktop"
      "io.github.ungoogled_software.ungoogled_chromium"
      "com.stremio.Stremio"
      "com.github.tchx84.Flatseal"
    ];

    overrides = {
      global = {
        Context.filesystems = [
          "~/.themes"
          "/nix/store:ro" # theme files are symlinks into the store
        ];

        Environment.GTK_THEME = "Catppuccin-Mocha-Standard-Red-dark";
      };

      # Gives browser access to every device node (webhid) 
      "io.github.ungoogled_software.ungoogled_chromium".Context.devices = [ "all" ];
    };
  };
}
