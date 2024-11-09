final: prev: {
  calibre-web = prev.calibre-web.overrideAttrs (oldAttrs: {
    version = "0.6.22";
    src = prev.pkgs.fetchFromGitHub {
      owner = "janeczku";
      repo = "calibre-web";
      rev = "0925f34557cab849e622581fe399fef5437f0a37";
      hash = "sha256-lbS36DxnzHBNhJ/Ny/IOWpsPonPcW2VZmjgqkXi1T/s=";
    };
    propagatedBuildInputs =
      oldAttrs.propagatedBuildInputs
      ++ [
        prev.pkgs.python3Packages.regex
      ];
  });
}
