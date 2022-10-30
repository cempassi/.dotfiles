{
  config,
  pkgs,
  ...
}: {

  home.file.".oh-my-zsh/custom/themes/personal.zsh-theme".source = ./personal.zsh-theme ;

  programs.zsh = {
    enable = true;

    defaultKeymap = "viins";
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh/custom";
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
      cat = "bat";
      dvim = "nvim --cmd \"set rtp+=$PWD\"";
      space = "dust ~";
      vim = "nvim ";
      hack = "sudo dscl . -append /groups/admin GroupMembership cedric.mpassi";
    };

    localVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=230";
    };

    initExtra = ''
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      export TERMINFO_DIRS=$HOME/.local/share/terminfo
    '';
  };
}
