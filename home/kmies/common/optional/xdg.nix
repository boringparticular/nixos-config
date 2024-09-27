{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    xdg-user-dirs
  ];

  xdg.configFile."mimeapps.list".force = true;
  xdg = {
    enable = true;
    defaultApplicatioons = let
      browser = ["zen.desktop"];
      editor = ["nvim.desktop" "code.desktop" "mousepad.desktop"];
      pdfReader = ["zathura.desktop" "okular.desktop"];
    in {
      "application/pdf" = pdfReader;

      "application/json" = browser;
      "application/rdf+xml" = browser;
      "application/rss+xml" = browser;
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;
      "application/x-extension-shtml" = browser;
      "application/x-extension-xht" = browser;
      "application/x-extension-xhtml" = browser;
      "application/xhtml+xml" = browser;
      "application/xhtml_xml" = browser;
      "application/xml" = browser;
      "text/html" = browser;
      "text/xml" = browser;
      "x-scheme-handler/about" = browser; # open `about:` url with `browser`
      "x-scheme-handler/ftp" = browser; # open `ftp:` url with `browser`
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;

      "application/x-wine-extension-ini" = editor;
      "text/plain" = editor;

      "x-scheme-handler/discord" = ["discord.desktop"];
      "x-scheme-handler/tg" = ["org.telegram.desktop.desktop "];

      "x-scheme-handler/vscode" = ["code-url-handler.desktop"];

      "audio/*" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
      "image/*" = ["imv-dir.desktop"];
      "image/gif" = ["imv-dir.desktop"];
      "image/jpeg" = ["imv-dir.desktop"];
      "image/png" = ["imv-dir.desktop"];
      "image/webp" = ["imv-dir.desktop"];
    };
  };
}
