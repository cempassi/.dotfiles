{
  config,
  pkgs,
  ...
}: {
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
      ls = "exa --icons ";
      ll = "exa -1 --icons ";
      lt = "exa -T --icons ";
      le = "exa -lah --icons --ignore-glob='.git' ";
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
}
