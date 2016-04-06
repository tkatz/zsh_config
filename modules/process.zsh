function pid {
  ps -ax -o pid,cmd | grep $@ | grep -v "grep"
}

function limits {
  pid=$(pid $@ | awk '{print $1}')
  pid_count=$(echo "$pid" | wc -l | tr -d " ")
  if [ $pid_count -ne 1 ]; then
    echo "Ambigous pid's ($pid_count)"
    echo "Use 'pid $@' for more informations"
    return 1
  fi
  cat "/proc/$pid/limits"
}


