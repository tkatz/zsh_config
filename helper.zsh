# plugin management
alias zsh_config_edit="atom $ZSH_CONFIG_DIR" # open zsh config folder

alias zsh_config_reload='exec $SHELL -l' # reload zsh

function zsh_config_update {
  cd $ZSH_CONFIG_DIR;
  git pull
  cd - 1> /dev/null
  for plugin in $(find "$ZSH_PLUGIN_DIR" -type d -mindepth 1 -maxdepth 1); do
    echo "* update $plugin";
    cd $plugin;
    git pull
    cd - 1> /dev/null
  done
  zsh_reload
}

function zsh_plugin_load {
  plugin_name=$1
  plugin_dir="$ZSH_PLUGIN_DIR/$plugin_name"
  zsh_file=$2

  # try default files
  if [ -z "$zsh_file" ]; then
    zsh_file="$plugin_name.zsh";
    if [ -e "$plugin_dir/$plugin_name.zsh" ]; then
      zsh_file="$plugin_name.zsh";
    elif [ -e "$plugin_dir/$plugin_name.plugin.zsh" ]; then
      zsh_file="$plugin_name.plugin.zsh";
    fi
  fi

  if [ ! -e "$plugin_dir/$zsh_file" ]; then
    echo "* $repo_name: zsh plugin file not found $plugin_dir/$zsh_file" 1>&2
    echo
    return;
  fi
  source "$plugin_dir/$zsh_file"
}

function zsh_plugin_install {
  repo_url=$1
  plugin_name=$(basename "$repo_url" ".${repo_url##*.}")
  plugin_dir="$ZSH_PLUGIN_DIR/$plugin_name"

  zsh_file=$2

  if [ ! -e "$plugin_dir" ]; then
    echo "* install $plugin_name";
    git clone "$repo_url" "$plugin_dir"
    echo
  fi

  zsh_plugin_load "$plugin_name" "$zsh_file"
}
