{inputs, ...}: final: prev: {
  zen-browser = inputs.zen-browser.packages.${prev.system}.specific.overrideAttrs (
    oldAttrs: {
      src = builtins.fetchTarball {
        url = "https://github.com/zen-browser/desktop/releases/download/1.0.1-a.17/zen.linux-specific.tar.bz2";
        sha256 = "0ahpig3kafphg0pnkl1r60b9phfp5s2rilpxb20q2fwz41d1miwi";
      };
    }
  );
}
