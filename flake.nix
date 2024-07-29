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

    devenv-nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "devenv-nixpkgs";
    };
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, flake-utils, beam-utils, devenv, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            beam-utils.overlays.default
            (import ./nix/overlay.nix)
          ];
        };

        devenv-shell = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            {
              services.postgres = {
                enable = true;
                createDatabase = false;
                listen_addresses = "127.0.0.1";
                port = 5432;
              };
            }
          ];
        };

        devenv-up = self.devShells.${system}.devenv.config.procfileScript;
      in
      {
        devShells = {
          default = pkgs.myCallPackage ./nix/shell.nix { };
          devenv = devenv-shell;
        };

        packages =
          let
            release = pkgs.myCallPackage ./nix/release.nix { };

            buildDockerImage = hostSystem: pkgs.myCallPackage ./nix/docker-image.nix ({
              inherit release hostSystem;
            } // inputs);
            docker-images = builtins.listToAttrs (map
              (hostSystem: {
                name = "docker-image-triggered-by-${hostSystem}";
                value = buildDockerImage hostSystem;
              })
              flake-utils.lib.defaultSystems);
          in
          { inherit release devenv-up; } // docker-images;

        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
