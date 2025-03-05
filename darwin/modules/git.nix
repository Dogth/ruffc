{ vars, pkgs, ... }:
{

  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      git-filter-repo
    ];

    programs.git = {
      difftastic = {
        enable = true;
      };
      enable = true;
      userName = vars.user;
      userEmail = vars.email;
      aliases = {
        co = "checkout";
        ci = "commit";
        cia = "commit --amend";
        s = "status";
        st = "status";
        b = "branch";
        pu = "push";
      };
      signing = {
        key = "/Users/${vars.user}/.ssh/git.pub";
      };
      iniContent = {
        branch.sort = "-committerdate";
        rerere.enabled = true;
      };
      ignores = [
        "*~"
        "*.swp"
      ];
      lfs.enable = true;
      extraConfig = {
        init.defaultBranch = "master";
        core.editor = "nvim";
        credential.helper = "store --file ~/.git-credentials";
        pull.rebase = "false";
        gpg.format = "ssh";
      };
    };
  };
}
