ZSH_CONFIG_DIR="$(dirname $0)"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

bindkey -e

export VISUAL=vim
export EDITOR=vim

setopt INTERACTIVE_COMMENTS


# Vi mode
#bindkey -v

# Configs ######################################################################
# for file in ./*.zsh(.N); do
#   source $file
# done

source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/completions.zsh"
source "$ZSH_CONFIG_DIR/history.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
