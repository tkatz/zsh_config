export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LC_ALL="en_US.UTF-8"

export ZSH_CONFIG_DIR=$(echo "${(%):-%x}" | sed 's|/[^/]*$||')
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_MODULE_DIR="$ZSH_CONFIG_DIR/modules"
export ZSH_FILE_DIR="$ZSH_CONFIG_DIR/files"
