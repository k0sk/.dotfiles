# Source Prezto. {{{1
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
fpath=($HOME/.zsh/functions/*(N-/) $fpath)

# Commands {{{1
# OS {{{2
alias df="df -h"
case "$OSTYPE" in
darwin*|bsd*)
  alias ls="ls -FGh"
  ;;
linux*)
  alias ls="ls -Fh --color"
  ;;
esac
alias ll="ls -l"
alias la="ll -A"

# Dev {{{2
alias gco="gcc -O2 -Wall -o"
alias gpo="g++ -O2 -Wall -o"
eval "$(hub alias -s)"
eval "$(direnv hook zsh)"

# Files {{{2
alias -s c=vim
alias -s cpp=vim
alias -s rb=vim
alias -s html=atom
alias -s log="less -MN"


# Preferences {{{1
# Edit command line with editor {{{2
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Corsor move {{{2
bindkey '^B' beginning-of-line
bindkey '^A' end-of-line

# Press enter {{{2
autoload -Uz enter
zle -N enter
bindkey '^M' enter

# After cd {{{2
chpwd() {
  ls-abbrev
  git-status-abbrev
}


# Plugins/Functions {{{1
# Auto suggestions {{{2
source $HOME/.zsh/plugins/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
  zle autosuggest-start
}
zle -N zle-line-init
bindkey '^I' expand-or-complete
bindkey '^W' forward-word
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# cd bookmark {{{2
autoload -Uz cd-bookmark
alias cb="cd-bookmark"

# Blank enter {{{2
# ls abbrev {{{3
autoload -Uz ls-abbrev
# git status abbrev {{{3
autoload -Uz git-status-abbrev

# peco {{{2
# Kill process {{{3
autoload -Uz peco-kill
# Search file from git repo and open with vim {{{3
autoload -Uz peco-git-ls
# Search history {{{3
autoload -Uz peco-history
zle -N peco-history
bindkey '^R' peco-history
# Search and move directory {{{3
autoload -Uz peco-find
zle -N peco-find
bindkey '^X^F' peco-find

# Modeline {{{2
# vim: foldmethod=marker
# vim: foldcolumn=3
# vim: foldlevel=1
