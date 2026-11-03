{ username, ... }:
{
  home-manager.users.${username} = {
    programs.librewolf = {
      enable = true;

      settings = {
        "font.name.monospace.x-western" = "JetBrainsMono Nerd Font";
        "font.name.serif.x-western" = "Noto Serif";
        "font.size.variable.x-western" = 15;

        "layout.css.always_underline_links" = true;
        "general.autoScroll" = true;
        "middlemouse.paste" = false;

        "browser.uidensity" = 1;
        "browser.startup.page" = 3;
        "browser.fullscreen.autohide" = false;

        "browser.newtabpage.activity-stream.hideLogo" = true;

        "browser.urlbar.placeholderName" = "DuckDuckGo No-AI";
        "browser.urlbar.placeholderName.private" = "DuckDuckGo No-AI";

        "browser.toolbars.bookmarks.visibility" = "newtab";

        "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "custom";
        "browser.newtabpage.activity-stream.newtabWallpapers.customWallpaper.theme" = "dark";
        "browser.newtabpage.activity-stream.newtabWallpapers.customWallpaper.position" = "center";

        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      };
    };
  };
}