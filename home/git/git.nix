{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    includes = [
      {
        path = "~/.config/git/work";
        condition = "gitdir:~/Programming/work/";
      }
    ];

    userName = "Cedric M'Passi";
    userEmail = "cempassi@student.42.fr";

    extraConfig = {
      init.defaultBranch = "main";
      github.user = "cempassi";
      pull.rebase = true;
      push.default = "current";
      pull.default = "current";
      format.pretty = "format:%C(yellow)[%h] %Cblue%>(2)[%ad] %Cgreen%<(7)[%an]%C(auto)%d %s";
      core.editor = "nvim";
      diff.tool = "nvimdiff";
      difftool = {
        prompt = true;
        nvimdiff = {
          cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
        };
      };

      color = {
        branch = {
          current = "yellow reverse";
          local = "yellow";
          remote = "green";
        };

        diff = {
          meta = "yellow bold";
          frag = "magenta bold";
          old = "red";
          new = "green";
        };

        status = {
          added = "green";
          changed = "blue";
          untracked = "red";
        };
      };
    };

    aliases = {
      ls = "log -n 20 --relative-date --graph --abbrev-commit --decorate";
      ll = "log --relative-date --graph --abbrev-commit --decorate";
      resolve = "! git diff --name-only | uniq | xargs nvim";
      btree = "log --graph --date=relative --pretty='%C(yellow)[%h] %Cblue[%ad] %C(auto)%d %s'";
      tree = "log --graph --date=relative --pretty='%C(yellow)[%h] %Cblue[%ad] %C(auto)%d %s' --all --decorate=short  --color=always";
      graph = "log --graph --date=relative --pretty='%C(yellow)[%h] %Cblue[%ad] %C(auto)%d %s' --all --decorate=short  --color=always --simplify-by-decoration";
      info = "! onefetch";
      stale = "! git branch -r --merged master | grep -v master | sed 's|origin/||' ";
      cleanup = "! git branch -r --merged master | grep -v master | sed 's|origin/||' | xargs -n 1 git push --delete origin";
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        whitespace-error-style = "22 reverse";
        decorations = {
          syntax-theme = "base16";
        };
      };
    };

    ignores = [
      ".admin"
      "*.o"
      "*.so"
      "*.out"
      "*.pyc"
      "*.a"
      "*.swp"
      "*.swo"
      "*.swn"
      ".tags"
      ".tasks"
      ".env.local"
      ".env.*.local"
      "npm-debug.log*"
      "yarn-debug.log*"
      "yarn-error.log*"
      ".idea"
      ".vscode"
      "*.suo"
      "*.ntvs*"
      "*.njsproj"
      "*.sln"
      "*.sw?"
      ".clang-format"
      "compile_commands.json"
      "pyrightconfig.json"
      "*.7z"
      "*.dmg"
      "*.gz"
      "*.iso"
      "*.jar"
      "*.rar"
      "*.tar"
      "*.zip"
      "*.clangd"
      "Cargo.lock"
      "node_modules"
      ".DS_Store"
      ".DS_Store?"
      "*.dSYM"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      "ehthumbs.db"
      "Thumbs.db"
      ".python-version"
      "secrets.zsh"
      "*.gpg"
      "neovim/.config/nvim/plugin/packer_compiled.lua"
      "plugin/packer_compiled.lua"
      "dist/"
    ];
  };
}
