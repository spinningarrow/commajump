let pkgs = import <nixpkgs> {};

in pkgs.stdenv.mkDerivation rec {
  name = "commajump";

  buildInputs = with pkgs; [
    fish
  ];
}
