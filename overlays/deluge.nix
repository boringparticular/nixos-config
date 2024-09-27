{inputs, ...}: final: prev: let
  old-pkgs = import inputs.nixpkgs-deluge1 {
    inherit (final) system;
    config.allowUnfree = true;
  };
in {
  deluge1 = old-pkgs.deluge-1_x;
}
