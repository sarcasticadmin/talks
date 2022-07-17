let
  pkgs = import <nixpkgs> {};

  texlive = pkgs.texlive.combine {
    inherit (pkgs.texlive)
    scheme-small
    beamer
    beamertheme-metropolis
    pgfopts
    ;
  };
in {
  slides = pkgs.stdenv.mkDerivation {
    name = "slides";
    src = ./.;

    buildInputs = [
      texlive
      pkgs.rubber
    ];

    installPhase = ''
      mkdir -p $out
      cp slides.pdf $out/
    '';
  };
}
