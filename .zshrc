# Source Prezto. {{{1
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Alias {{{1
# OS {{{2
alias df="df -h"
alias lss="ls -alhGF"

# Compiler {{{2
alias gco="gcc -Wall -o"
alias gpo="g++ -Wall -o"


# Preferences {{{1
# Edit command line with editor {{{2
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
# Corsor move {{{2
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


# Functions {{{1
# Auto suggestions {{{2
source $HOME/.zsh/plugins/zsh-autosuggestions/autosuggestions.zsh
autosuggest-start
bindkey '^I' menu-expand-or-complete
bindkey '^F' forward-word
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# cd bookmark {{{2
fpath=($HOME/.zsh/plugins/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark
alias cb="cd-bookmark"

# peco {{{2
# Kill process {{{3
function pkill() {
  ps -ef | peco | awk '{ print $2 }' | xargs kill
  zle clear-screen
}
# Search file from git repo and open with vim {{{3
function pgls() {
  vim `git ls-files | peco`
}
# Search history {{{3
function phis() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N phis
bindkey '^R' phis
# Search and move directory {{{3
function pdfind() {
  local current_buffer=$BUFFER
  local selected_dir="$(find . -maxdepth 5 -type d ! -path "*/.*"| peco)"
  if [ -d "$selected_dir" ]; then
    BUFFER="${selected_dir}"
    CURSOR=$#BUFFER
    zle accept-line
  fi
  zle clear-screen
}
zle -N pdfind
bindkey '^X^F' pdfind


# Modeline {{{2
# vim: foldmethod=marker
# vim: foldcolumn=3
# vim: foldlevel=1
