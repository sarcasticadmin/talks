{ texLive, rubber, stdenv, lib }:

stdenv.mkDerivation {
  pname = "simple";
  version = "1970-01-01";

  src = ./.;

  buildInputs = [
    texLive
    rubber
  ];

  installPhase = ''
    mkdir -p $out
    cp slides.pdf $out/$pname-slides.pdf
  '';
}
