# Plugins ######################################################################
ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"

# zsh-syntax-highlighting ######################################################
if [ ! -e "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_DIR/zsh-syntax-highlighting
fi
source $ZSH_CONFIG_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# zsh-history-substring-search #################################################
if [ ! -e "$ZSH_PLUGIN_DIR/zsh-history-substring-search" ]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_PLUGIN_DIR/zsh-history-substring-search
fi
source $ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# zsh-history-substring-search configuration
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up     # bind arrow-up
bindkey '^[[B' history-substring-search-down   # bind arrow-down


zsh-autosuggestions ##########################################################
if [ ! -e "$ZSH_PLUGIN_DIR/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
fi
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh


# zsh-completions ##############################################################
if [ ! -e "$ZSH_PLUGIN_DIR/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGIN_DIR/zsh-completions
fi
source $ZSH_PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
