# Plugins ######################################################################

# zsh-syntax-highlighting ######################################################
_zshrc_plugin_install 'https://github.com/zsh-users/zsh-syntax-highlighting.git'

# zsh-history-substring-search #################################################
_zshrc_plugin_install 'https://github.com/zsh-users/zsh-history-substring-search.git'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

bindkey '^[[A' history-substring-search-up     # bind arrow-up
bindkey '^[[B' history-substring-search-down   # bind arrow-down

# zsh-completions ##############################################"################
_zshrc_plugin_install 'https://github.com/zsh-users/zsh-completions.git'

# docker completitions
if ! $(find "$ZSH_PLUGIN_DIR/zsh-completions/src/_docker" -mmin +$(expr 60 \* 24 \* 7) 2> /dev/null); then
  echo "update docker completition"
  curl -s -L -o "$ZSH_PLUGIN_DIR/zsh-completions/src/_docker" "https://raw.githubusercontent.com/docker/docker/v$(docker version --format '{{.Client.Version}}')/contrib/completion/zsh/_docker"
fi

# docker-compose completitions
if ! $(find "$ZSH_PLUGIN_DIR/zsh-completions/src/_docker-compose" -mmin +$(expr 60 \* 24 \* 7) 2> /dev/null); then
  echo "update docker-compose completition"
  curl -s -L -o "$ZSH_PLUGIN_DIR/zsh-completions/src/_docker-compose" "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose"
fi

# docker-compose completitions
if ! $(find "$ZSH_PLUGIN_DIR/zsh-completions/src/_brew" -mmin +$(expr 60 \* 24 \* 7) 2> /dev/null); then
  echo "update brew completition"
  curl -s -L -o "$ZSH_PLUGIN_DIR/zsh-completions/src/_brew" "https://raw.githubusercontent.com/Homebrew/brew/master/share/zsh/site-functions/_brew"
fi
