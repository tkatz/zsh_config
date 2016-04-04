## Changing shell for User
# chsh -s /bin/zsh

export ZSH_CONFIG_DIR="$(dirname $0)"
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_FUNCTION_DIR="$ZSH_CONFIG_DIR/functions"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=vim

LC_ALL="en_US.UTF-8"

# emacs mode
bindkey -e # emacs mode

# vim mode
# bindkey -v # Vi mode


# for file in ./*.zsh(.N); do
#   source $file
# done

# load helper module
source "$ZSH_CONFIG_DIR/helper.zsh"

# load plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"
# load all functions
for function in $(find "$ZSH_FUNCTION_DIR" -type f -name '*.zsh'); do
  source $function
done
# load aliases
source "$ZSH_CONFIG_DIR/aliases.zsh"
# load history
source "$ZSH_CONFIG_DIR/history.zsh"
# load prompt
source "$ZSH_CONFIG_DIR/prompt.zsh"
# load completions
source "$ZSH_CONFIG_DIR/completions.zsh"
