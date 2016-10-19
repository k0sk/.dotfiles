# Source Prezto. {{{1
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
fpath=($HOME/.zsh/functions/*(N-/) $fpath)

# zplug
if [[ -s "$HOME/.zplug/init.zsh" ]]; then
  source "$HOME/.zplug/init.zsh"
fi

zplug 'direnv/direnv', as:command, from:gh-r, rename-to:direnv
zplug 'peco/peco', as:command, from:gh-r, rename-to:peco
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf
zplug 'b4b4r07/enhancd', use:'init.sh'
zplug 'b4b4r07/cli-finder', as:command, use:'bin/finder'
zplug 'b4b4r07/easy-oneliner', on:'junegunn/fzf-bin'
zplug 'stedolan/jq', from:gh-r, as:command
zplug 'b4b4r07/emoji-cli', on:'stedolan/jq'
zplug "mrowa44/emojify", as:command

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

# OS/Machine specifics {{{1
if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

if (( $+commands[brew] && $+commands[pyenv] )); then
  alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
fi

if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi
if (( $+commands[hub] )); then eval "$(hub alias -s)"; fi

# Preferences {{{1
# Edit command line with editor {{{2
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^V' edit-command-line

# Corsor move {{{2
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Press enter {{{2
autoload -Uz enter
zle -N enter
bindkey '^J' enter
# bindkey '^M' enter

# After cd {{{2
chpwd() {
  ls-abbrev
  git-status-abbrev
}


# Plugins/Functions {{{1
# Auto suggestions {{{2
bindkey '^I' expand-or-complete
bindkey '^W' forward-word
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# cd bookmark {{{2
autoload -Uz cd-bookmark
alias cb="cd-bookmark"

# tmux auto attach {{{2
autoload -Uz tmux-auto-attach
tmux-auto-attach

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

# fzf
# MRU
autoload -Uz mru
# Modeline {{{2
# vim: foldmethod=marker
# vim: foldcolumn=3
# vim: foldlevel=1
