{
  inputs.nixpkgs.url = "nixpkgs/master";

  outputs = flakes @ { self, nixpkgs }:
    let
      # System types to support.
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in
    {
      overlay = final: prev:
        with final.pkgs;
        {
          texLive = final.texlive.combine {
            inherit (final.texlive)
              scheme-small
              beamer
              # Theme reqs
              beamertheme-metropolis
              beamertheme-pure-minimalistic
              silence
              fira
              fontaxes
              # Adding necessary fonts, specifically: phvr7t
              collection-fontsrecommended
              pgfopts
              multirow
              ;
          };
          simple-slides = final.callPackage ./simple/default.nix { };
          openwrt-at-scale = final.callPackage ./openwrt-at-scale/default.nix { };
          all-slides = final.linkFarmFromDrvs "all-slides" [ simple-slides openwrt-at-scale ];

        };

      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system}) simple-slides openwrt-at-scale all-slides;
      });

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs;[
              texLive
              rubber
              zathura
            ];
          };
          present =
            pkgs.mkShell {
              buildInputs = with pkgs;[
                pdfpc
              ];
            };
          release =
            let
              ciRelease = pkgs.writeScriptBin "ci-release" ''
                test ! -z $RELEASE_TAG || { echo "Please set RELEASE_TAG variable"; exit 1; }
                nix build '.#all-slides'
                gh release create $RELEASE_TAG result/**/*.pdf -t "$RELEASE_TAG" --notes ""
              '';
            in
            pkgs.mkShell {
              buildInputs = with pkgs;[
                gh
              ] ++ [ ciRelease ];
            };

        });
    };
  # Bold green prompt for `nix develop`
  # Had to add extra escape chars to each special char
  nixConfig.bash-prompt = "\\[\\033[01;32m\\][nix-flakes \\W] \$\\[\\033[00m\\] ";

}
