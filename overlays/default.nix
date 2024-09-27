{inputs, ...}: {
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
      config.allowUnfree = true;
    };
  };
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  master-packages = final: prev: {
    unstable = import inputs.nixpkgs-master {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
