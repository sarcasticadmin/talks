let
  pkgs = import <nixpkgs> {};

  # https://ctan.org/ for what to combine in texlive
  texlive = pkgs.texlive.combine {
    inherit (pkgs.texlive)
    scheme-small
    beamer
    # Theme reqs
    beamertheme-metropolis
    pgfopts
    multirow
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
