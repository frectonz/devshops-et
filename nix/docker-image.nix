{ release
, dockerTools
, glibcLocalesUtf8
, coreutils
, curl
, buildPackages
, ...
}:
let
  name = release.pname;
  docker = dockerTools.override {
    writePython3 = buildPackages.writers.writePython3;
  };
in
docker.buildLayeredImage {
  inherit name;
  tag = "latest";
  created = "now";

  contents = [
    dockerTools.caCertificates
    dockerTools.binSh
    coreutils
    curl
  ];

  config = {
    Env = [
      "LOCALE_ARCHIVE=${glibcLocalesUtf8}/lib/locale/locale-archive"
      "LC_ALL=en_US.UTF-8"
      "TERM=vt100"
    ];
    WorkingDir = release;
    Cmd = [ "sh" "-c" "${release}/bin/migrate && ${release}/bin/server start" ];
  };
}
