## Changing shell for User
# chsh -s /bin/zsh

ZSH_CONFIG_DIR="$(dirname $0)"
ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
ZSH_FUNCTION_DIR="$ZSH_CONFIG_DIR/functions"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=vim

setopt INTERACTIVE_COMMENTS

# emacs mode
bindkey -e # emacs mode

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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
