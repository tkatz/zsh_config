function ls_find {
  # if [[ "$@" != *" - "* ]]; then
  #   find_args="$@"
  # else
  #   ls_args=$(echo "$@" | sed -e 's/\(.*\) - \(.*\)/\1/')
  #   find_args=$(echo "$@" | sed -e 's/\(.*\) - \(.*\)/\2/')
  # fi
  #
  # ls $ls_args -d $(find $find_args )
  ls -d $(find $@ )
}