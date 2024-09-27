{inputs, ...}: final: prev: let
  pkgs = import inputs.nixpkgs-working-chrome-electron {
    inherit (final) system;
    config.allowUnfree = true;
  };
in {
  vscode = pkgs.vscode;
  google-chrome = pkgs.google-chrome;
}
