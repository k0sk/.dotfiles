#
# Browser
#
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi


#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'


#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='ja-JP.UTF-8'
fi


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
  /usr/local/heroku/bin
  /Applications/ADT/sdk/{tools,platform-tools}
  /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
  $path
)


#
# Less
#
# Default Less options
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
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi
