{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = ["FiraCode" "Noto" "JetBrainsMono"];
    })

    noto-fonts
    noto-fonts-cjk
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-emoji
    noto-fonts-lgc-plus
  ];
}
