{
  vars,
  ...
}:
{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - p: open -a Alacritty -n
      alt - e: open -a Neovide -n --maximized
    '';
  };
  home-manager.users.${vars.user} = {
    home.activation = {
      skhd-reloader = ''
        run skhd -r
      '';
    };
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
    };
  };

}
