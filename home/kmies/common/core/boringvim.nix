{inputs, ...}: {
  imports = [
    inputs.boringvim.homeModule
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  boringVim = {
    enable = true;
    packageNames = ["boringVim" "testNvim"];
  };
}
