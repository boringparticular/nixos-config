{inputs, ...}: final: prev: {
  zen-browser = inputs.zen-browser.packages.${prev.system}.specific.overrideAttrs (
    oldAttrs: {
      src = builtins.fetchTarball {
        url = "https://github.com/zen-browser/desktop/releases/download/1.0.1-a.5/zen.linux-specific.tar.bz2";
        sha256 = "sha256:0rj8x0b7vnl6zj8mky9qip54l1cp8rpy0465gr28zsjnjhp7qyak";
      };
    }
  );
}
