# plugin management
ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"

function zsh_plugin_install {
  repo_url=$1
  zsh_file=$2
  repo_name=$(basename "$repo_url" ".${repo_url##*.}")
  plugin_dir="$ZSH_PLUGIN_DIR/$repo_name"

  if [ ! -e "$plugin_dir" ]; then
    echo "* install $repo_name";
    git clone "$repo_url" "$plugin_dir"
    echo
  fi

  if [ -z "$zsh_file" ]; then
    zsh_file="$repo_name.zsh";
    if [ ! -e "$plugin_dir/$zsh_file" ] && [ -e "$plugin_dir/$repo_name.plugin.zsh" ]; then
      zsh_file="$repo_name.plugin.zsh";
    fi
  fi

  if [ ! -e "$plugin_dir/$zsh_file" ]; then
    echo "* $repo_name: zsh plugin file not found $plugin_dir/$zsh_file" 1>&2
    echo
    return;
  fi
  source "$plugin_dir/$zsh_file"
}

function zsh_plugin_update {
  for plugin in $(echo $ZSH_PLUGIN_DIR/*); do echo "* $plugin";
    cd $plugin;
    git pull
    cd - 1> /dev/null
  done
}