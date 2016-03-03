# Plugins ######################################################################

## install hh
## install htop

# zsh-autosuggestions ##########################################################
if [ ! -e "./plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ./plugins/zsh-autosuggestions
fi
source ./plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# zsh-completions ##############################################################
if [ ! -e "./plugins/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions.git ./plugins/zsh-completions
fi
source ./plugins/zsh-completions/zsh-completions.plugin.zsh


# zsh-history-substring-search #################################################
if [ ! -e "./plugins/zsh-history-substring-search" ]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search.git ./plugins/zsh-history-substring-search
fi
source ./plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

  # bind UP and DOWN arrow keys
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # bind P and N for EMACS mode
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down

  # bind k and j for VI mode
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down


# zsh-syntax-highlighting ######################################################
if [ ! -e "./plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./plugins/zsh-syntax-highlighting
fi
source ./plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
