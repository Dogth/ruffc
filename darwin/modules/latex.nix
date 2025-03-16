{ vars, pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-basic
        dvisvgm
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        ;
    }
  );
in
{
  home-manager.users.${vars.user} = {
    home.packages = [
      tex
    ];
  };
}
