# Completions ##################################################################

#setopt AUTO_CD
setopt EXTENDEDGLOB
#setopt GLOB_COMPLETE
setopt NOMATCH # If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list.
setopt COMPLETE_IN_WORD         # Not just at the end
setopt ALWAYS_TO_END            # When complete from middle, move cursor
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE


unsetopt CORRECT # disable Spelling corrections

autoload -Uz compinit && compinit

export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:*' force-list always
zstyle ':completion:*:*:*:*:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Hypen- & caseinsensitive matching

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' completer _complete

zstyle ':completion:*:*:*:*:processes' command 'ps -u ${USER} -o pid,user,command'
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-_]#)*=0=01;34=02=0'
zstyle ':completion:*:*:*:*:processes-names' command  'ps -c -u ${USER} -o command | uniq'

zstyle ':completion:*:killall:*' command 'ps -u $USER -o command'

###

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true


###
#zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
