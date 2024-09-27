final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    patches = [];
  });
}
