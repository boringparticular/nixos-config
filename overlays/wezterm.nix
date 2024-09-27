{inputs, ...}: final: prev: {
  wezterm = inputs.wezterm.packages.${final.system}.default;
}
