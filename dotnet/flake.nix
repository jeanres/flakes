{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; 
    flake-utils.url = "github:numtide/flake-utils";
  };

    outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        unstable_pkgs = import nixpkgs-unstable {
          inherit system;
        };
      in rec {
        devShell = pkgs.mkShell {
          packages = with pkgs; [ 
            dotnet-sdk_7
            nodejs
          ];
        };
    });
}
