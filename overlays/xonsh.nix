final: prev: {
  xonsh = prev.xonsh.override {
    extraPackages = ps:
      with ps; [
        (buildPythonPackage {
          pname = "xontrib-abbrevs";
          version = "0.1.0";
          format = "pyproject";

          propagatedBuildInputs = [
            setuptools
            setuptools-scm
            poetry-core
            prompt-toolkit
          ];

          src = pkgs.fetchFromGitHub {
            owner = "xonsh";
            repo = "xontrib-abbrevs";
            rev = "ce58c42bf7beabd84c848411525f678b23f9ab01";
            hash = "sha256-zeZpQ5DwbcnwueWU3GElkF0gB7n2ZLjQ8l08AqTYOKA=sha256-zeZpQ5DwbcnwueWU3GElkF0gB7n2ZLjQ8l08AqTYOKA=";
          };
          prePatch = ''
            substituteInPlace pyproject.toml --replace '"xonsh>=0.17",' ""
          '';
          doCheck = false;
        })
        (buildPythonPackage {
          pname = "xontrib-fish-completer";
          version = "2023-05-31";
          format = "pyproject";

          propagatedBuildInputs = [
            setuptools
          ];

          src = pkgs.fetchFromGitHub {
            owner = "xonsh";
            repo = "xontrib-fish-completer";
            rev = "c7edff47e738cb4f64589e540aaf3575719aa574";
            hash = "sha256-spkFwKHyd+mJ91Tj2z4RcaomLU9Q6JBDI75IQTgCRaE=";
          };
          prePatch = ''
            substituteInPlace pyproject.toml --replace '"xonsh>=0.12.5"' ""
          '';
          patchPhase = "sed -i -e 's/^dependencies.*$/dependencies = []/' pyproject.toml";
          # patchphase = "sed -i -e 's/^dependencies.*$/dependencies = []/' pyproject.toml";
          doCheck = false;
        })
        (buildPythonPackage {
          pname = "xonsh-direnv";
          version = "2022-06-19";

          propagatedBuildInputs = [
            setuptools
          ];

          src = pkgs.fetchFromGitHub {
            owner = "74th";
            repo = "xonsh-direnv";
            rev = "a8e3bec7c9e43ccb4ae9a79e58a99a3ec7c4f7eb";
            hash = "sha256-1SLb4gx73NSUG1Fshmvj+21hD9j2UnK+RcTolq1zJiI=";
          };
          doCheck = false;
        })
        (buildPythonPackage {
          pname = "xonsh-zoxide";
          version = "v1.0.0";
          format = "pyproject";

          propagatedBuildInputs = [
            setuptools
            poetry-core
            xonsh
          ];

          src = pkgs.fetchFromGitHub {
            owner = "dyuri";
            repo = "xontrib-zoxide";
            rev = "36d3d0bc5945f2cd7aefdff598c6f7eeccfb1770";
            hash = "sha256-lYx5dfmVebSYls9rbvAeD8GdzYkwv/qy75xp1m+/mdA=";
          };

          doCheck = false;
        })
      ];
  };
}
