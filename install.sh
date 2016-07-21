#!/bin/sh
#
# add loader command to ~/.zshrc
#

ZSH_CONFIG_DIR="$(pwd)/$(dirname $0)"
LOADER_COMMAND="source $ZSH_CONFIG_DIR/zshrc"
ZSHRC_FILE="$HOME/.zshrc"

if ! [ -e "$ZSHRC_FILE" ] || ! (cat "$ZSHRC_FILE" | grep "$LOADER_COMMAND" > /dev/null ); then
  echo "$LOADER_COMMAND" >> "$HOME/.zshrc"
  echo "added loader command '$LOADER_COMMAND' to $ZSHRC_FILE"
else
  echo "already installed!" >&2
  exit 1
fi