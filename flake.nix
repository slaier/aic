{
  description = "Rust development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
          rustPackages.clippy
          rustPackages.cargo
          rustPackages.rustc
          rustPackages.rustfmt
          openssl
          pkg-config
          rust-analyzer
        ];
      };

      formatter.x86_64-linux = pkgs.nixfmt-tree;
    };
}
