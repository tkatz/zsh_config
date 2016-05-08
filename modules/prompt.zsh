# Promt ########################################################################

# ↓↑●✖✚

setopt NOTIFY # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt INTERACTIVE_COMMENTS # Allowes to use #-sign as comment within commandline

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U colors && colors

# count prompt for command
local CMD_ID=0
function preexec {
  CMD_ID=$(expr $CMD_ID + 1)
}

#print all default colors
function fg_print {
  for k in "${(@k)fg}"; do
    echo "$fg[$k]$k$reset_color"
    echo "$fg_bold[$k]$k$reset_color"
    echo "$bg[$k]$k$reset_color"
    echo "$bg_bold[$k]$k$reset_color"
  done
}

# setopt print_exit_value         # Alert me if something's failed
# print exit code on error
local FAILD_CMD_ID=0
function precmd {
  exit_code=$?
  if [ $exit_code -ne 0 ] && [ $FAILD_CMD_ID -ne $CMD_ID ]; then
    FAILD_CMD_ID=$CMD_ID
    echo "${fg_bold[red]}✖ $exit_code$reset_color"
  fi

  current_user=$(whoami)
  current_host=$(hostname -s)
  current_dir=$(pwd | sed -e "s|^$HOME|~|" -e 's-\([^/.]\)[^/]*/-\1/-g')
  current_branch=$(git branch 2> /dev/null | sed -n '/\* /s///p' | sed 's/^( *//;s/ *)$//;')



  # precmd start
  precmd="${fg_bold[grey]}#$reset_color "

  # current_user & current_host
  if [ "$current_user" = "root" ]; then precmd+="${fg_bold[red]}"; else precmd+="${fg[cyan]}"; fi
  precmd+="$current_user$reset_color${fg_bold[grey]}@$reset_color${fg[blue]}$current_host$reset_color"

  # current_dir
  precmd+=" ${fg_bold[grey]}in$reset_color ${fg[yellow]}$current_dir$reset_color"

  # current_branch
  if [ -n "$current_branch" ]; then
    if [[ "$current_branch" != "detached "* ]]; then
      precmd+=" ${fg_bold[grey]}on$reset_color"
    fi;
    precmd+=" ${fg[green]}$current_branch$reset_color"
  fi

  echo "$precmd"
}

# setopt promptsubst # substitude variables within prompt string
PS1='❯ '
PS2='▪ '

# right prompt
# RPROMPT='[%D{%H:%M:%S}]' # date
