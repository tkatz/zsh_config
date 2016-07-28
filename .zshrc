# aliases

# load core module
source "$ZSH_MODULE_DIR/core.zsh"
source "$ZSH_MODULE_DIR/plugins.zsh"

# load all modules
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  [ "$module" = "$ZSH_MODULE_DIR/core.zsh" ] && continue
  [ "$module" = "$ZSH_MODULE_DIR/plugins.zsh" ] && continue
  source $module
done
