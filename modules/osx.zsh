
function notify {
  title=${1/\"/\\\"}
  message=${2/\"/\\\"}
  subtitle=${3/\"/\\\"}
  sound=${4/\"/\\\"}

  script="display notification \"$message\" with title \"$title\" subtitle \"$subtitle\""
  if [ -n "$sound" ]; then
    script="$script sound name \"$sound\""
  fi

  osascript -e "$script"
}
