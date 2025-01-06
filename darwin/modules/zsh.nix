{ pkgs, vars, ... }:
{

  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      ripgrep
      wget
      gnupg
      eza
      nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        history.size = 10000;
        oh-my-zsh = {
          enable = true;
          plugins = [
            "macos"
          ];
        };

        initExtra = ''
          ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#868686'

          alias ls="${pkgs.eza}/bin/eza --icons=always --color=always"
          alias ev="neovide"
        '';
      };
      direnv = {
        enable = true;
      };
    };
  };
}
