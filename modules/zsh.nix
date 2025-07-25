{ pkgs, ... }:
{

  home-manager.users.dogth = {
    home.packages = with pkgs; [
      ripgrep
      wget
      gnupg
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
          theme = "philips";
          enable = true;
          plugins = [
            "macos"
            "git"
            "git-commit"
            "jira"
            "web-search"
            "colorize"
            "battery"
            "brew"
            "direnv"
          ];
        };

        initContent = ''
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
