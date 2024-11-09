{inputs, ...}: {
  calibre-web = import ./calibre-web.nix;
  chrome-fix = import ./chrome-fix.nix {inherit inputs;};
  deluge1 = import ./deluge.nix {inherit inputs;};
  vivaldi = import ./vivaldi.nix {inherit inputs;};
  waybar = import ./waybar.nix;
  wezterm = import ./wezterm.nix {inherit inputs;};
  xonsh = import ./xonsh.nix;
  zen-browser = import ./zen-browser.nix {inherit inputs;};
  stable-packages = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-27.3.11"
        ];
      };
    };
  };
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-27.3.11"
        ];
      };
    };
  };
  master-packages = final: prev: {
    master = import inputs.nixpkgs-master {
      system = final.system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-27.3.11"
        ];
      };
    };
  };
}
