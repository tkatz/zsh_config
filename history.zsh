# History ######################################################################
HISTFILE=~/.zsh_history         # enable history saving on shell exit
HISTSIZE=10000                  # lines of history to maintain memory
SAVEHIST=$HISTFILESIZE          # lines of history to maintain in history file.
setopt append_history           # append rather than overwrite history file.
setopt extended_history         # save timestamp and runtime information
setopt hist_expire_dups_first   # allow dups, but expire old ones when I hit HISTSIZE
#setopt hist_ignore_dups         # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
#setopt inc_append_history
#setopt share_history # share command history data

# HH configuration
export HISTFILE=$HISTFILE       # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)
