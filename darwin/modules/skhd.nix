{
  vars,
  ...
}:
{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - return: open -a Alacritty -n
      alt - e: open -a Neovide -n
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
