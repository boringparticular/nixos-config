{pkgs, ...}: {
  nix = {
    package = pkgs.lix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
        "https://cache.nixos.org"
        "https://cache.lix.systems"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = ["@wheel"];
      warn-dirty = false;
    };
    gc = {
      # disabled because i'm using nh for garbage collection
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };
    optimise.automatic = true;
  };
}
