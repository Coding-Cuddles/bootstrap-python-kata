{ pkgs }: {
  deps = [
    pkgs.python38Full
    pkgs.python38Packages.pytest_6_1
  ];
  env = {
    PYTHONBIN = "${pkgs.python38Full}/bin/python3.8";
    PYTHONPATH = "${pkgs.python38Packages.pytest_6_1}/lib/python3.8/site-packages";
    LANG = "en_US.UTF-8";
  };
}