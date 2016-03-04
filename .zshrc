export ZSH_CONFIG_DIR=$(dirname $0)
cd "$ZSH_CONFIG_DIR"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Imports ######################################################################
source ./plugins.zsh
source ./history.zsh
source ./prompt.zsh
source ./completions.zsh
source ./aliases.zsh