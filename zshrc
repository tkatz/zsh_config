ZSH_CONFIG_DIR="$(dirname $0)"
ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
ZSH_FUNCTION_DIR="$ZSH_CONFIG_DIR/functions"

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

# load plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# load all functions
for function in $(find "$ZSH_FUNCTION_DIR" -type f -name '*.zsh'); do
  source $function
done

source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/history.zsh"
source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/completions.zsh"



