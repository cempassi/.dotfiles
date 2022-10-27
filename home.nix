{
  config,
  pkgs,
  ...
}: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "cempassi";
    homeDirectory = "/Users/cedric.mpassi";

    sessionPath = [
      "$HOME/.luarocks/bin" # Lua
      "$PYENV_ROOT/bin" #Pyenv
      "$HOME/.cargo/bin" # Rust
      "/nix/var/nix/profiles/default/bin" # Nix Default
      "$HOME/.nix-profile/bin" #Nix profile
      "$HOME/.tfenv/bin" # Terraform
    ];

    sessionVariables = {
      EDITOR = "nvim";
      PYENV_ROOT = "${config.home.homeDirectory}/.pyenv";
      LSCOLORS = "exfxcxdxbxegedabagacad";
      SSH_KEY_PATH = "~/.ssh/rsa_id";
      BAT_THEME = "Nord";
      KEYTIMEOUT = 1;
      PAGER = "bat --paging=auto --plain";
      MAIL = "cempassi@student.42.fr";
      NODE_EXTRA_CA_CERTS = "${config.home.homeDirectory}/.local/certs/ca-bundle.crt";
      NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  home.file.".config/git/work".source = ./git/.gitconfig-work;

  programs.git = {
    enable = true;
    userName = "Cedric M'Passi";
    userEmail = "cempassi@student.42.fr";

    includes = [
      {
        path = "~/.config/git/work";
        condition = "gitdir:~/Programming/work/";
      }
    ];

    ignores = [
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
    ];

    extraConfig = {
      pull.rebase = false;
      push.default = "current";
      format.pretty = "format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)[%aN]%C(auto)%d %Creset%s";
      core = {
        editor = "nvim";
      };
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
      tree = "log --all --graph --date=relative --pretty=format:'%C(auto,yellow)[%h][%ad]%C(auto,white) %s %C(auto, blue)%d %C(auto,red)[%an]'";
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        whitespace-error-style = "22 reverse";
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-style = "bold yellow ul";
          file-decoration-style = " none ";
        };
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    defaultKeymap = "viins";
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.dotfiles/zsh";
      plugins = [
        "vi-mode"
        "rust"
        "docker"
        "git"
      ];
      theme = "personal";
    };

    shellAliases = {
      ls = "exa - -icons ";
      ll = "exa - 1 - -icons ";
      lt = "exa - T - -icons ";
      le = "exa - lah - -icons - -ignore-glob='.git' ";
      cd = "z";
      status = "git status";
      szsh = "source ~/.zshrc";
      evim = "vim ~/.config/nvim/init.vim";
      enix = "vim ~/.config/nixpkgs/home.nix";
      cat = "bat";
      switch = "home-manager switch";
      dvim = "nvim --cmd \"set rtp+=$PWD\"";
      space = "dust ~";
      vim = "nvim ";
    };

    localVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=230";
    };

    initExtra = ''
      # Init pyenv
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      export TERMINFO_DIRS=$HOME/.local/share/terminfo
    '';
  };

  home.packages = [
    # Text Editor
    pkgs.neovim
    pkgs.terraform-ls
    pkgs.stylua
    pkgs.black
    pkgs.selene
    pkgs.shfmt
    pkgs.alejandra
    pkgs.sumneko-lua-language-server
    pkgs.nodePackages.yaml-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.typescript
    pkgs.nodePackages.pyright
    pkgs.nodePackages.prettier
    pkgs.rnix-lsp

    # Rust Cli tools
    pkgs.ripgrep
    pkgs.tokei
    pkgs.delta
    pkgs.bat
    pkgs.exa
    pkgs.zoxide
    pkgs.fd
    pkgs.bottom
    pkgs.diskonaut
    pkgs.du-dust
    pkgs.rust-analyzer

    # Code managers
    pkgs.gh
    pkgs.glab

    # Utils
    pkgs.bash
    pkgs.stow
    pkgs.bitwarden-cli
    pkgs.tmux
    pkgs.jq
    pkgs.fzf
    pkgs.glow
    pkgs.ncurses6
    pkgs.kube3d
  ];
}
