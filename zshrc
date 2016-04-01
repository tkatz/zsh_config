ZSH_CONFIG_DIR="$(dirname $0)"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=vim

bindkey -e # emacs mode
# bindkey -v # Vi mode

setopt INTERACTIVE_COMMENTS

# for file in ./*.zsh(.N); do
#   source $file
# done

source "$ZSH_CONFIG_DIR/zshrc.zsh"

source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/history.zsh"
source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/completions.zsh"



