# Promt ########################################################################
setopt NOTIFY #Report the status of background jobs immediately, rather than waiting until just before printing a prompt.


autoload -U colors && colors

LC_ALL="en_US.UTF-8"

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

#Your branch and 'origin/master' have diverged,
# and have 1 and 1 different commit each, respectively.

#Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.

#Changes to be committed:

#Changes not staged for commit:

#Untracked files:

#
# …clean…
#
# …dirty…
#
# …ahead…
#
# …behind…
#
# …branches have diverged… ↓↑●✖✚

# c_cyan=`tput setaf 6`
# c_red=`tput setaf 1`
# c_green=`tput setaf 2`
# c_sgr0=`tput sgr0`
# c_pink=`tput setaf 5`
# parse_git_branch ()
# {
# git rev-parse –git-dir >/dev/null 2>&1
# if [ $? -eq 0 ]; then
# remote=””
# git_status=”$(git status 2> /dev/null)”
# if [ $? -eq 128 ]; then
# echo ” (!GIT_DIR!)”
# else
# branch=`git rev-parse –abbrev-ref HEAD`
# git config –get branch.$branch.remote >/dev/null 2>&1
# if [ $? -eq 0 ]; then
# #its a tracking branch
# behind=`git log ..@{u} –pretty=oneline | wc -l | sed -e ‘s/[ \t]*//g’`
# ahead=`git log @{u}.. –pretty=oneline | wc -l | sed -e ‘s/[ \t]*//g’`
# diverged=`git log @{u}… –pretty=oneline | wc -l | sed -e ‘s/[ \t]*//g’`
#
# if [ $diverged -ne 0 ]; then
#
# if [ “$behind” == “$diverged” ]; then
# #remote=” [$behind]↓”
# remote=”↓”
# elif [ “$ahead” == “$diverged” ]; then
# #remote=” [$ahead]
# remote=”↑”
# else
# remote=”↕”
# #remote=” [$behind]↓ [$ahead]↑”
# fi
# fi
# fi
# echo ” (${branch}${remote})”
# fi
# else
# return 0
# fi
# }
# branch_color ()
# {
# color=””
# git rev-parse –git-dir >/dev/null 2>&1
# if [ $? -eq 0 ]; then
# git status –untracked-files=no –porcelain >/dev/null 2>&1
# if [ $? -eq 128 ]; then
# color=${c_pink}
# elif [ -z “$(git status –untracked-files=no –porcelain)” ]; then
# color=”${c_green}”
# else
# color=${c_red}
# fi
# else
# return 0
# fi
# echo -ne $color
# }
#
# export PS1=’\[33[1;32m\]\u\[33[0m\]@\[33[1;36m\]\h\[33[0m\] \W\[$(branch_color)\]$(parse_git_branch)\[33[0m\] \$ ‘

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
