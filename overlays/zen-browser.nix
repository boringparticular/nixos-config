{inputs, ...}: final: prev: {
  zen-browser = inputs.zen-browser.packages.${prev.system}.specific.overrideAttrs (
    oldAttrs: {
      src = builtins.fetchTarball {
        url = "https://github.com/zen-browser/desktop/releases/download/1.0.1-a.19/zen.linux-specific.tar.bz2";
        sha256 = "sha256:1g7nq1yfaya97m43vnkjj1nd9g570viy8hj45c523hcyr1z92rjq";
      };
    }
  );
}
