#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Browser
#
case "$OSTYPE" in
  darwin*)
    export BROWSER='open'
    export HOMEBREW_BREWFILE=~/.brewfile
    ;;
  linux*)
    export BROWSER='google-chrome-stable'
    ;;
esac

#
# Env
#
export SHELL="$(which zsh)"
export XDG_CONFIG_HOME=~/.config

#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

#
# Aliases
#
alias gco="gcc -O2 -Wall"
alias gpo="g++ -O2 -Wall"

#
# Paths
#

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

cdpath=(
  ..
  $HOME
  $HOME/Repos
  $cdpath
)
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# OS/Machine-specific profile
#
if [[ -r $HOME/.zprofile_local ]]; then
  source $HOME/.zprofile_local
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
