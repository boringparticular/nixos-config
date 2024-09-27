{inputs, ...}: let
  secretspath = builtins.toString inputs.mysecrets;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      keyFile = "/home/kmies/.config/sops/age/keys.txt";
    };

    secrets = {
      "private_keys/kmies" = {
        path = "/home/kmies/.ssh/id_ed25519";
      };
    };
  };
}
