export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ZSH_CONFIG_DIR=${ZSH_CONFIG_DIR:-$(echo "${(%):-%x}" | sed 's|/[^/]*$||')}
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_MODULE_DIR="$ZSH_CONFIG_DIR/modules"
export ZSH_FILE_DIR="$ZSH_CONFIG_DIR/files"

export VISUAL=vim
export EDITOR=vim

bindkey -e # -e emacs mode -v for vi mode

# press ctrl + v and then KEY or KEY-COMPINATION to find exact keybindings
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
