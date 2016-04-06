## Changing shell for User
# chsh -s /bin/zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=vim

export ZSH_CONFIG_DIR="$(dirname $0)"
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_MODULE_DIR="$ZSH_CONFIG_DIR/modules"

export LC_ALL="en_US.UTF-8"

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
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  source $module
done
# load aliases
source "$ZSH_CONFIG_DIR/aliases.zsh"
