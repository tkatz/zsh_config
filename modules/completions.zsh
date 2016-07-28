# Completions ##################################################################

# setopt AUTO_CD
setopt EXTENDEDGLOB
# setopt GLOB_COMPLETE
setopt NOMATCH # If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list.
setopt COMPLETE_IN_WORD # Not just at the end
setopt ALWAYS_TO_END # When complete from middle, move cursor
setopt AUTO_LIST # Automatically list choices on ambiguous completion.
# setopt AUTO_MENU # Show completion menu on a successive tab press.
# setopt MENU_COMPLETE # Do autoselect the first completion entry.

unsetopt CORRECT # disable Spelling corrections

autoload -Uz compinit && compinit

# ls Colors
export LSCOLORS="exfxcxdxbxegedabagacad" #used by ls
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"


# Fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate _history
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)' # the number of allowed errors by _approximate increases with the length of what you have typed so far


zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Hypen- & caseinsensitive matching
zstyle ':completion:*' list-colors "$LS_COLORS"

zstyle ':completion:*' menu select

# ## Listing behaviour
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' force-list always
# zstyle ':completion:*' last-prompt true
# zstyle ':completion:*' list-dirs-first true
# zstyle ':completion:*' list-grouped true
# zstyle ':completion:*' list-packed true
# zstyle ':completion:*' list-separator '--'
# zstyle ':completion:*' separate-sections true
# ## Output properties
#zstyle ':completion:*' show-completer true
# ## Menu behaviour
# zstyle ':completion:*' menu yes select
# zstyle ':completion:*' insert-unanbiguous false
# zstyle '*' single-ignored show
# ## Show more information for matches
# zstyle ':completion:*' extra-verbose true
# zstyle ':completion:*' file-list always
# zstyle ':completion:*' strip-comments false
# ## Use caching
# zstyle ':completion::complete:*' use-cache true
# zstyle ':completion::complete:*' cache-path ~/.cache/


zstyle ':completion:*:cd:*' ignore-parents parent pwd # cd will never select the parent directory (e.g.: cd ../<TAB>)

zstyle ':completion:*:*:*:*:processes' command 'ps -u ${USER} -o pid,user,command'
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-_]#)*=0=01;34=02=0'

zstyle ':completion:*:*:*:*:processes-names' command  'ps -c -u ${USER} -o command | uniq'

zstyle ':completion:*:*kill:*' force-list always

zstyle ':completion:*:killall:*' command 'ps -u $USER -o command'



###

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true


###
#zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
