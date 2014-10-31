# PATH {{{1
export PATH="/usr/local/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Android SDK
export PATH="/Applications/ADT/sdk/platform-tools:$PATH"
export PATH="/Applications/ADT/sdk/tools:$PATH"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Sublime
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin/:$PATH"

# Text Wrangler
alias tw='open -a /Applications/TextWrangler.app'

GNUTERM=x11