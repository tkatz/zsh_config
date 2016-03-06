# Open new iTerm and Terminal tabs from the command line
#
# Author: Bengt Brodersen
#
# Usage:
#     tab                   Opens the current directory in a new pane
#     tab [PATH]            Open PATH in a new pane
#     tab [CMD]             Open a new tab and execute CMD
#     tab [PATH] [CMD] ...  You can prolly guess
function pane {
    cmd=$(echo "$@")
    cmd=$(echo "$cmd" | sed 's/\\\\/\\\\\\\\/g' | sed 's/"/\\\"/g')

    case "$TERM_PROGRAM" in

      'iTerm.app')
        osascript -e "tell application \"System Events\" to keystroke \"d\" using {shift down, command down}"
        if [ -n "$cmd" ]; then
          osascript -e "tell application \"System Events\" to keystroke \"$cmd\n\""
        fi
        ;;
      *)
        echo "Unsuported terminal: $TERM_PROGRAM" >&2
        ;;
    esac

}

function panex {
    declare -a commands
    commands=$@
    osascript -e "tell application \"System Events\" to keystroke \"n\" using {command down}"

    first_command=true
    for cmd in $commands; do
      if [ frist_command ]; then
        osascript -e "tell application \"System Events\" to keystroke \"$cmd\n\""
        frist_command=false
      else
        pane "$cmd"
      fi
    done
    #osascript -e "tell application \"System Events\" to keystroke (ASCII character 31) using {option down, command down}"
    #osascript -e "tell application \"System Events\" to keystroke \"d\" using {control down}"
    #osascript -e "tell application \"System Events\" to keystroke \"i\" using {option down, command down}"
}
