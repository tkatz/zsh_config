# aliases
# #### suffix aliases
# alias -s jpeg="open"

# load core module
source "$ZSH_MODULE_DIR/zsh_core.zsh"
source "$ZSH_MODULE_DIR/zsh_plugins.zsh"
test -e "$ZSH_CONFIG_DIR/.zshrc.local" && source "$ZSH_CONFIG_DIR/.zshrc.local"

# load all modules
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  [ "$module" = "$ZSH_MODULE_DIR/zsh_core.zsh" ] && continue
  [ "$module" = "$ZSH_MODULE_DIR/zsh_plugins.zsh" ] && continue
  source $module
done
