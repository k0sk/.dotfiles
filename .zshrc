# Source Prezto. {{{1
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Commands {{{1
# OS {{{2
alias df="df -h"
alias ls="ls -FGh"
alias ll="ls -l"
alias la="ll -A"
# Dev {{{2
alias gco="gcc -O2 -Wall -o"
alias gpo="g++ -O2 -Wall -o"
eval "$(hub alias -s)"
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
bindkey '^X^E' edit-command-line
# Corsor move {{{2
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
# Press enter {{{2
function do-enter() {
  if [ -n "$BUFFER" ]; then
    zle .end-of-line
    zle accept-line
    return 0
  fi
  echo
  ls-abbrev
  git-status
  echo
  zle reset-prompt
  return 0
}
zle -N do-enter
bindkey '^M' do-enter
# After cd {{{2
chpwd() {
  ls-abbrev
  git-status
}

# Functions {{{1
# Auto suggestions {{{2
source $HOME/.zsh/plugins/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
  zle autosuggest-start
}
zle -N zle-line-init
bindkey '^I' expand-or-complete
bindkey '^F' forward-word
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# cd bookmark {{{2
fpath=($HOME/.zsh/plugins/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark
alias cb="cd-bookmark"

# Blank enter {{{2
# ls abbreviation {{{3
function ls-abbrev() {
  if [[ ! -r $PWD ]]; then
    return
  fi
  # -a : Do not ignore entries starting with ..
  # -C : Force multi-column output.
  # -F : Append indicator (one of */=>@|) to entries.
  local cmd_ls='ls'
  local -a opt_ls
  opt_ls=('-aCF' '--color=always')
  case "${OSTYPE}" in
    freebsd*|darwin*)
      opt_ls=('-aCFG')
  esac

  local ls_result
  ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

  local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

  if [ $ls_lines -gt 10 ]; then
    echo "$ls_result" | head -n 5
    echo '...'
    echo "$ls_result" | tail -n 5
    echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
  else
    echo "$ls_result"
  fi
}

# git repo status {{{3
function git-status() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    echo
    echo -e "\e[0;33m--- git status ---\e[0m"
    git status -sb
  fi
}

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
