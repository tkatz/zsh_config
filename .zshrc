# aliases

# load helper module
source "$ZSH_CONFIG_DIR/helper.zsh"

# load plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# load all modules
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  source $module
done
