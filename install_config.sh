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
ZSHRC_FILE="$HOME/.zshrc"
ZSHCONF_DIR=$SELF_DIR

ZSHENV_FILE_COMMAND="export ZSH_CONFIG_DIR=\"$ZSHCONF_DIR\"; test -e \"\$ZSH_CONFIG_DIR/.zshenv\" && source \"\$ZSH_CONFIG_DIR/.zshenv\""
ZSHRC_FILE_COMMAND="test -e \"\$ZSH_CONFIG_DIR/.zshrc\" && source \"\$ZSH_CONFIG_DIR/.zshrc\""

if grep -xq "$ZSHENV_FILE_COMMAND" "$ZSHENV_FILE" ; then
  echo "zsh config already installed within $ZSHENV_FILE"
else
  echo "install zsh config within $ZSHENV_FILE"
  echo "$ZSHENV_FILE_COMMAND" >> "$ZSHENV_FILE"
fi
if grep -xq "$ZSHRC_FILE_COMMAND" "$ZSHRC_FILE" ; then
  echo "zsh config already installed within $ZSHRC_FILE"
else
  echo "install zsh config within $ZSHRC_FILE"
  echo "$ZSHRC_FILE_COMMAND" >> "$ZSHRC_FILE"
fi

USER=${USER:-$(id -un)}
if [ "$(uname)" == "Darwin" ]; then
  CURRENT_USER_SHELL=$(dscl . -read /Users/$USER | grep UserShell | cut -d' ' -f2)
else
  CURRENT_USER_SHELL=$(getent passwd $USER | cut -d':' -f7)
fi
if [ "$CURRENT_USER_SHELL" == "/bin/zsh" ]; then
  echo "user shell already is /bin/zsh"
elif ask "Want to change shell for current user?"; then
  if ! grep -xq "/bin/zsh" "/etc/shells"; then
    echo "/bin/zsh" >> "/etc/shells"
  fi
  chsh -s /bin/zsh
fi
