{inputs, ...}: final: prev: let
  pkgs = import inputs.nixpkgs-working-chrome-electron {
    inherit (final) system;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };
in {
  vscode = pkgs.vscode;
  google-chrome = pkgs.google-chrome;
}
