{inputs, ...}: {
  inherit (inputs.nix-secrets) hosts;
  username = "kmies";
}
