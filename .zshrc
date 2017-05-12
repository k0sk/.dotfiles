#
# Prezto
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# zplug
#
if [[ -s "$HOME/.zplug/init.zsh" ]]; then
  source "$HOME/.zplug/init.zsh"
fi

# System
zplug 'rcmdnk/open_newtab', as:command, use:'bin/open_newtab', \
    rename-to:otab, if:"[[ $OSTYPE == *darwin* ]]"

# Dev
zplug 'direnv/direnv', as:command, from:gh-r, rename-to:direnv
zplug 'github/hub', as:command, from:gh-r, rename-to:hub, \
    if:"[[ $OSTYPE == *linux* ]]"

# Interactive filtering
zplug 'peco/peco', as:command, from:gh-r, rename-to:peco
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf
zplug 'b4b4r07/enhancd', use:'init.sh'
zplug 'b4b4r07/cli-finder', as:command, use:'bin/finder'
zplug 'b4b4r07/easy-oneliner', on:'junegunn/fzf-bin'
zplug "b4b4r07/git-conflict", as:command, use:'git-conflict'

# Emoji
zplug 'stedolan/jq', from:gh-r, as:command
zplug 'b4b4r07/emoji-cli', on:'stedolan/jq'
zplug "mrowa44/emojify", as:command

if ! zplug check; then
  zplug check --verbose
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

#
# Env
#
if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

if (( $+commands[brew] && $+commands[pyenv] )); then
  alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
fi

if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi
if (( $+commands[hub] )); then eval "$(hub alias -s)"; fi

#
# Preferences
#

# Auto suggestions
#bindkey '^I' expand-or-complete
#bindkey '^W' forward-word
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Edit command line with editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^V' edit-command-line

# Corsor move
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Press enter
autoload -Uz enter
zle -N enter
bindkey '^J' enter

# ls and git status after cd
chpwd() {
  ls-abbrev
  git-status-abbrev
}

#
# Functions/Plugins
#
fpath=($HOME/.zsh/functions/*(N-/) $fpath)

# cd bookmark
autoload -Uz cd-bookmark
alias cb="cd-bookmark"

# tmux auto attach
autoload -Uz tmux-auto-attach
tmux-auto-attach

# ls abbrev
autoload -Uz ls-abbrev
# git status abbrev
autoload -Uz git-status-abbrev

## peco
# Kill process
autoload -Uz peco-kill
zle -N peco-kill
bindkey '^K^K' peco-kill

# Search file from git repo and open with vim
autoload -Uz peco-git-ls

# Search history
autoload -Uz peco-history
zle -N peco-history
bindkey '^R' peco-history

# Search and move directory
autoload -Uz peco-find
zle -N peco-find
bindkey '^P^F' peco-find

## fzf
# MRU
autoload -Uz mru

# vim:fdm=marker fdc=3 ft=zsh ts=4 sw=4 sts=4:
