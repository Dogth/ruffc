{
  home-manager.users.dogth = {

    programs = {
      difftastic = {
        enable = true;
      };

      git = {
        enable = true;
        settings = {
          core.editor = "nvim";
          user = {
            name = "dogth";
            email = "dogth@kitteth.com";
          };
          aliases = {
            co = "checkout";
            ci = "commit";
            cia = "commit --amend";
            s = "status";
            st = "status";
            b = "branch";
            pu = "push";
          };
          extraConfig = {
            init.defaultBranch = "master";
            core.editor = "nvim";
            credential.helper = "store --file ~/.git-credentials";
            pull.rebase = "false";
            gpg.format = "ssh";
          };

        };

        signing = {
          key = "/Users/dogth/.ssh/git.pub";
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
      };
    };
  };
}
