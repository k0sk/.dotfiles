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

# Zsh plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

# Theme
zplug "denysdovhan/spaceship-zsh-theme", as:theme, use:"spaceship.zsh", \
    if:"[[ $OSTYPE == *darwin* ]]"

# macOS
zplug "rcmdnk/open_newtab", as:command, use:"bin/open_newtab", \
    rename-to:otab, if:"[[ $OSTYPE == *darwin* ]]"
zplug "gnachman/iTerm2", as:command, use:"tests/{imgcat,imgls}", \
    if:"[[ $OSTYPE == *darwin* ]]"

# Dev
zplug "direnv/direnv", as:command, from:gh-r, rename-to:direnv
zplug "github/hub", as:command, from:gh-r, rename-to:hub, \
    if:"[[ $OSTYPE == *linux* ]]"
zplug "stedolan/jq", as:command, from:gh-r
zplug "jingweno/ccat", as:command, from:gh-r, rename-to:ccat
zplug "sharkdp/bat", as:command, from:gh-r, rename-to:bat
zplug "b4b4r07/httpstat", as:command, use:"httpstat.sh", rename-to:httpstat
zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd
zplug "raylee/tldr", as:command, use:"tldr"
zplug "browsh-org/browsh", as:command, from:gh-r, rename-to:browsh
zplug "thisredone/rb", as:command, use:"rb"
zplug "denilsonsa/prettyping", as:command, use:"prettyping"

# Interactive filtering
zplug "peco/peco", as:command, from:gh-r, rename-to:peco
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "b4b4r07/enhancd", use:"init.sh"
zplug "b4b4r07/cli-finder", as:command, use:"bin/finder"
zplug "b4b4r07/easy-oneliner", on:"junegunn/fzf-bin"
zplug "b4b4r07/git-conflict", as:command, use:"git-conflict"
zplug "akavel/up", as:command, from:gh-r, rename-to:up

# Emoji
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
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
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

if (( $+commands[brew] && $+commands[pyenv] )); then
  alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
fi

if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi
if (( $+commands[hub] )); then eval "$(hub alias -s)"; fi
if (( $+commands[bat] )); then alias cat='bat'; fi
if (( $+commands[htop] )); then alias top='htop'; fi
if (( $+commands[prettyping] )); then alias ping='prettyping'; fi

#
# Preferences
#

# Auto suggestions
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# Edit command line with editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^V" edit-command-line

# Cursor move
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# Accept and execute a suggestion
bindkey "^J" autosuggest-execute

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
bindkey "^P^K" peco-kill

# Search file from git repo and open with vim
autoload -Uz peco-git-ls
bindkey "^P^G" peco-kill

# Search history
autoload -Uz peco-history
zle -N peco-history
bindkey "^R" peco-history

# Search and move directory
autoload -Uz peco-find
zle -N peco-find
bindkey "^P^F" peco-find

## fzf
# MRU
autoload -Uz mru

# vim:fdm=marker fdc=3 ft=zsh ts=4 sw=4 sts=4:

