{ texLive, rubber, stdenv, lib }:

stdenv.mkDerivation {
  pname = "openwrt-at-scale";
  version = "2022-09-31";

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
