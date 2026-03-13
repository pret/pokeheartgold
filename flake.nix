{
  description = "POKEHEARTGOLD decomp nix development shell";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake rec {
      inherit self nixpkgs;
      name = "pokeheartgold-shell";
      # Native shell instead of an arm-cross shell so utilities are properly compiled for host
      shell = { pkgs }: pkgs.mkShell {
        inherit name;

        nativeBuildInputs = [
          pkgs.git
          pkgs.wineWow64Packages.base # wine with both 32 and 64 bits support
          pkgs.python3
          pkgs.pkg-config
          pkgs.pkgsCross.arm-embedded.stdenv.cc.bintools # binutils
          pkgs.unzip
          pkgs.p7zip
          pkgs.clang-tools      # For the formatting
          pkgs.libclang.python  # and the pre-commit hook
        ];

        buildInputs = [
          pkgs.libpng
        ];
      };
    };
}
