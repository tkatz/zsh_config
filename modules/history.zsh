# History ######################################################################
HISTFILE=$HOME/.zhistory     # enable history saving on shell exit
HISTSIZE=10000                  # lines of history to maintain memory
SAVEHIST=$HISTSIZE              # lines of history to maintain in history file.
setopt EXTENDED_HISTORY         # save timestamp and runtime information
setopt APPEND_HISTORY           # append rather than overwrite history file.
setopt INC_APPEND_HISTORY       # append to history immediately.

setopt HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when I hit HISTSIZE
#setopt HIST_IGNORE_DUPS        # ignore consecutive duplication in command history list
setopt HIST_IGNORE_ALL_DUPS     # ignore all duplication in command history list
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
#setopt SHARE_HISTORY # share command history between sessions
setopt NO_HIST_BEEP

# HH configuration
export HISTFILE=$HISTFILE       # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors

bindkey -s "^R" "hh\n"            # bind Ctrl + r
