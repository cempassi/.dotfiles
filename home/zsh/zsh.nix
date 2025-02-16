{
  config,
  pkgs,
  ...
}: {
  home.file.".oh-my-zsh/custom/themes/personal.zsh-theme".source = ./personal.zsh-theme;

  programs.zsh = {
    enable = true;

    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh/custom";
      plugins = [
        "vi-mode"
        "rust"
        "git"
      ];
      theme = "personal";
    };

    shellAliases = {
      ls = "exa --icons ";
      ll = "exa -1 --icons ";
      lt = "exa -T --icons ";
      le = "exa -lah --icons --ignore-glob='.git' ";
      cd = "z";
      status = "git status";
      szsh = "source ~/.zshrc";
      evim = "vim ~/.config/nvim/init.vim";
      cat = "bat";
      dvim = "nvim --cmd \"set rtp+=$PWD\"";
      space = "dust ~";
      vim = "nvim ";
      vi = "nvim ";
    };

    localVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=230";
    };

    initExtra = ''
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      export TERMINFO_DIRS=$HOME/.local/share/terminfo
      export PATH=$NIX_PATH:$PATH
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
    '';
  };
}
