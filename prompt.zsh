# Promt ########################################################################
autoload -U colors && colors

LC_ALL="en_US.UTF-8"

local CMD_ID=0
function preexec {
  CMD_ID=$(expr $CMD_ID + 1)
}

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

  precmd="${fg_bold[blue]}#$reset_color "
  if [ "$USER" = "root" ]; then
    precmd+="${fg_bold[red]}$current_user$reset_color"
  else
    precmd+="${fg[cyan]}$current_user$reset_color"
  fi;
  precmd+="${fg[white]}@$reset_color${fg[green]}$current_host$reset_color"
  precmd+=" ${fg[white]}in$reset_color ${fg[yellow]}$current_dir$reset_color"
  echo "$precmd"
}

#setopt promptsubst
PS1='❯ '
PS2='▪ '

#RPROMPT='[%D{%H:%M:%S}]'

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
