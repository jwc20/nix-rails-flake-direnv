{
  description = "Developer environment shell rails app";

  inputs = {
    nixpkgs = {
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "e6d5772f3515b8518d50122471381feae7cbae36";
      type = "github";
    };
  };

  outputs =
    { self, nixpkgs }:
    let
      forAllSupportedSystems =
        f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });

      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
        "arm64-darwin" # mac m1
      ];
    in

    {
      devShells = forAllSupportedSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            shellHook = ''
              export RUBY_VERSION="$(ruby -e 'puts RUBY_VERSION.gsub(/\d+$/, "0")')"
              export GEM_HOME="$(pwd)/vendor/bundle/ruby/$RUBY_VERSION"
              export BUNDLE_PATH="$(pwd)/vendor/bundle"
              export PATH="$GEM_HOME/bin:$PATH"
            '';
            packages = [
              pkgs.docker
              pkgs.git
              pkgs.gnumake
              pkgs.terraform
              pkgs.nixpkgs-fmt
              pkgs.nodejs
              pkgs.nodePackages.pnpm
              pkgs.postgresql_11
              pkgs.ruby_3_1
              pkgs.imagemagick
            ];
          };
        }
      );
    };
}
