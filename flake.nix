{
  description = "Elixir development environment for Phoenix project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    beam-utils = {
      url = "github:nix-giant/beam-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, beam-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            beam-utils.overlays.default
            (import ./nix/overlay.nix)
          ];
        };
      in
      {
        devShells = {
          default = pkgs.myCallPackage ./nix/shell.nix { };
        };

        packages =
          let
            release = pkgs.myCallPackage ./nix/release.nix { };
            image = pkgs.myCallPackage ./nix/docker-image.nix ({
              inherit release;
            });

            version = "0.1.9";
            deploy = pkgs.writeShellScriptBin "deploy" ''
              ${pkgs.skopeo}/bin/skopeo --insecure-policy copy docker-archive:${image} docker://docker.io/frectonz/devshops_et:${version} --dest-creds="frectonz:$ACCESS_TOKEN"
              ${pkgs.skopeo}/bin/skopeo --insecure-policy copy docker://docker.io/frectonz/devshops_et:${version} docker://docker.io/frectonz/devshops_et:latest --dest-creds="frectonz:$ACCESS_TOKEN"
            '';
          in
          { inherit release image deploy; };

        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
