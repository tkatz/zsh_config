#!/bin/sh
#
# set ZDOTDIR to install script folder
#
function ask {
  read -p "$1 " response
  [[ $response == "y" || $response == "Y" || $response == "yes" || $response == "Yes" ]]
}

SELF_DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
SELF_DIR="$(echo "$SELF_DIR" | sed "s|^$HOME|\$HOME|")"

ZSHENV_FILE="$HOME/.zshenv"
ZSHCONF_DIR=$SELF_DIR
ZSHENV_FILE_COMMAND="ZDOTDIR=$ZSHCONF_DIR; source \$ZDOTDIR/.zshenv 2> /dev/null;"
if [ "$(cat "$ZSHENV_FILE")" == "$ZSHENV_FILE_COMMAND" ]; then
  echo "zsh config directory already is $ZSHCONF_DIR"
elif ask "Want to use $SELF_DIR as zsh config directory?"; then
  echo "Create $ZSHENV_FILE and set zsh config directory to $ZSHCONF_DIR"
  if [ -f "$ZSHENV_FILE" ]; then
    echo "File already exist." >&2
    echo " 1: Migrade $ZSHENV_FILE to $SELF_DIR/.zshenv if needed." >&2
    echo " 2: Delete $ZSHENV_FILE." >&2
    echo " 3: Run install again."
    exit 1
  fi
  echo "$ZSHENV_FILE_COMMAND" > "$ZSHENV_FILE"
fi

if [ "$(uname)" == "Darwin" ]; then
  CURRENT_USER_SHELL=$(dscl . -read /Users/$USER | grep UserShell | cut -c12-)
fi
if [ "$CURRENT_USER_SHELL" == "/bin/zsh" ]; then
  echo "user shell already is /bin/zsh"
elif ask "Want to change shell for current user?"; then
  chsh -s /bin/zsh
fi
