{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      url = "git+ssh://forgejo@forge.edgecube.io/kmies/nix-secrets.git?ref=main&shallow=1";
    };

    boringvim = {
      url = "git+ssh://forgejo@forge.edgecube.io/kmies/boringvim.git";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    catppuccin.url = "github:catppuccin/nix";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    waybar = {
      url = "github:Alexays/Waybar/0.10.4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs @ {
    self,
    flake-parts,
    ...
  }: let
    inherit (self) outputs;
    specialArgs = {
      inherit inputs;
      inherit outputs;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
      ];

      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            inputs.waybar.overlays.default
            outputs.overlays.waybar

            outputs.overlays.stable-packages
            outputs.overlays.unstable-packages
            outputs.overlays.master-packages

            outputs.overlays.calibre-web
            outputs.overlays.chrome-fix
            outputs.overlays.deluge1
            outputs.overlays.xonsh
            outputs.overlays.zen-browser
          ];
        };
        formatter = pkgs.alejandra;
        devShells.default = import ./shell.nix {inherit pkgs;};
      };

      flake = {
        overlays = import ./overlays {inherit inputs outputs;};
      };
    };
}
