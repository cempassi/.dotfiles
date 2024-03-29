# Comment

#Vim mode color Autoupdate

VIMODE=75

function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/196}/(main|viins)/75}"
    zle reset-prompt
}

if [[ -z "$SSH_CLIENT" ]]; then
        PROMPT_SSH=""
else
        PROMPT_SSH="%F{196}[$(hostname -s)]"
fi

if [[ -z "$IN_NIX_SHELL" ]]; then
    PROMPT_NIX_SHELL=""
else
    PROMPT_NIX_SHELL="%F{222}[${IN_NIX_SHELL}]"
fi

zle -N zle-keymap-select

PERSONAL_DATE="%F{222}%D %T%f"

PROMPT='${PROMPT_SSH}${PROMPT_NIX_SHELL}%F{$VIMODE}[%c] %f'

RPROMPT='$(git_prompt_status)%{$reset_color%} %F{167}$(git_prompt_info)%f [$PERSONAL_DATE]'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"
