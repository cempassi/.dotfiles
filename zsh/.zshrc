# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#Path export
LUA_PATH=$HOME/.luarocks/bin
PYTHON_PATH=$HOME/.pyenv/shims:/Users/cempassi/Library/Python/3.7/bin
RUST_PATH=$HOME/.cargo/bin
BREW_PATH=$HOME/.brew/bin
LOCAL_PATH=$HOME/Applications/bin
GIT_PATH=$HOME/usr/local/git/libexec/git-core
NIX_PATH=/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin
TF_PATH=$HOME/.tfenv/bin

BASE_PATH=$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:$(getconf PATH)

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$NIX_PATH:$TF_PATH:$GIT_PATH:$LUA_PATH:$RUST_PATH:$PYTHON_PATH:$BREW_PATH:$LOCAL_PATH:$BASE_PATH

ZSH_THEME=personal

# Vi edition
bindkey -v

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(zsh-autosuggestions zsh-completions vi-mode zsh-syntax-highlighting rust docker git)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=230'

zstyle ':completion:*:*:git:*' script ~/.oh-my-zsh/custom/git-completion.bash

# FROM: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2609770
# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Init zoxide
eval "$(zoxide init zsh)"

# Init pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
