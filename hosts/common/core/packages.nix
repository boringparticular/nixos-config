{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Optional?
    broot
    cheat
    choose
    cht-sh
    curlie
    delta
    dog
    glances
    gping
    gtop
    httpie
    hyperfine
    lsd
    mcfly
    silver-searcher
    tldr
    xh

    bat
    bottom
    du-dust
    duf
    eza
    fd
    fzf
    jq
    procs
    ripgrep
    sd

    just
    most
    # TODO: replace with nixCats
    neovim
    rsync
    tmux
    tree
    wget
  ];
}
