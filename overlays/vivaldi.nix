final: prev: {
  vivaldi-ffmpeg-codecs = prev.unstable.vivaldi-ffmpeg-codecs;
  vivaldi =
    prev.vivaldi.overrideAttrs
    (oldAttrs: {
      version = "6.7.3329.21";
      src = prev.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_6.7.3329.24-1_amd64.deb";
        hash = "sha256-ZfMq/b9T6rLULNsjkDHncqWpIwO6oqEmWgyEHhVOIHs=";
      };
    })
    .override {
      proprietaryCodecs = true;
      vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
    };
}
