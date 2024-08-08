{ lib, myEnv, nix-gitignore, tailwindcss, esbuild, ... }:
let
  pname = "devshops_et";
  version = "0.1.0";
  src = nix-gitignore.gitignoreSource [
    "/flake.nix"
    "/flake.lock"
  ] ../.;

  inherit (myEnv.beamPackages.minimal) fetchMixDeps buildMixRelease;
  inherit (myEnv.nodePackages) nodejs fetchNpmDeps;

  mixDeps = fetchMixDeps {
    pname = "${pname}-mix-deps";
    inherit version src;
    hash = "sha256-0xTKjzbBvi+trj0bxXkGTYBPY0Ac3i8zM46Q4KUEXJY=";
    HEX_HTTP_TIMEOUT = 10000;
  };

  npmDeps = fetchNpmDeps {
    pname = "${pname}-npm-deps";
    inherit version;
    src = "${src}/assets";
    hash = "sha256-lY2AzwGAHylb/4qju6tskWXHdk/BuLfsBdmAmjcDm70=";
    postBuild = ''
      # fix broken local packages
      local_packages=(
        "phoenix"
        "phoenix_html"
        "phoenix_live_view"
      )
      mkdir -p node_modules/
      for package in ''\${local_packages[@]}; do
        path=node_modules/$package
        if [[ -L $path ]]; then
          echo "fixing local package - $package"
          rm $path
          cp -r ${mixDeps}/deps/$package node_modules/
        fi
      done
    '';
  };
in
buildMixRelease {
  inherit pname version src;

  inherit mixDeps;
  nativeBuildInputs = [ nodejs ];

  removeCookie = false;

  preBuild = ''
    ln -s ${npmDeps}/node_modules assets/node_modules
  '';

  postBuild = ''
    HOME=$(pwd) mix assets.deploy
  '';

  MIX_ESBUILD_PATH = "${esbuild}/bin/esbuild";
  MIX_TAILWIND_PATH = "${tailwindcss}/bin/tailwindcss";
}
