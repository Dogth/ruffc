{
  vars,
  ...
}:
{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      cmd - p: open -a Alacritty -n
      cmd - m: open -a Neovide --maximized --title-hidden
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
