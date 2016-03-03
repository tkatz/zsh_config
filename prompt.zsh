# Promt
autoload -U colors && colors
function echo_color {
  local color=$1
  local text=$2
  echo -n "$color""$text""$reset_color"
}

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
    echo_color $fg_bold[red] "exit $exit_code"
    echo
  fi
}

#setopt PRINT_EXIT_VALUE

function prompt {
  current_dir=$(pwd | sed -e "s|^$HOME|~|" -e 's-\([^/.]\)[^/]*/-\1/-g')

  echo_color $fg_bold[blue] "# "
  if [ "$USER" = "root" ]; then
    echo_color $fg_bold[red] "$(whoami)"
  else
    echo_color $fg[cyan] "$(whoami)"
  fi;
  echo_color $fg[cyan] " @ "
  echo_color $fg[green] "$(hostname -s)"
  echo_color $fg[white] " in "
  echo_color $fg[yellow] "$current_dir "
  #echo_color $fg[white] " GIT_INFO "
  #echo_color $fg[white] " DATE "
  echo
  echo_color $fg_bold[white] "→ "
}

setopt promptsubst
PROMPT="$(prompt)"
