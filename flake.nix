{
  # Good overview of flakes: https://www.tweag.io/blog/2020-05-25-flakes/
  inputs.nixpkgs.url = "nixpkgs/master";

  outputs = flakes @ { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          self.overlays.default
        ];
        config = { allowUnfree = true; };
      };
    in
    {
      overlays.default =
        (final: prev: rec {
          texLive = final.texlive.combine {
            inherit (final.texlive)
              scheme-small
              beamer
              # Theme reqs
              beamertheme-metropolis
              pgfopts
              multirow
              ;
          };
          simple-slides = final.callPackage ./simple/default.nix { };
          openwrt-at-scale = final.callPackage ./openwrt-at-scale/default.nix { };
        });

        packages.x86_64-linux = {
                import nixpkgs { system = "x86_64-linux"; overlays = [ self.overlay ]; };
        inherit simple-slides;
      };

      devShells.x86_64-linux =
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs;[
              rubber
            ] ++ [ texLive ];
          };
        };
    };
  # Bold green prompt for `nix develop`
  # Had to add extra escape chars to each special char
  nixConfig.bash-prompt = "\\[\\033[01;32m\\][nix-flakes \\W] \$\\[\\033[00m\\] ";
}
