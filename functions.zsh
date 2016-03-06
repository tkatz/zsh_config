# Functions ####################################################################
ZSH_FUNCTION_DIR="$ZSH_CONFIG_DIR/functions"

for file in "$ZSH_FUNCTION_DIR"/*.zsh(.N); do # (.N) is for null_glob option
  source $file
done
