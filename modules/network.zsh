function ip-internal {
  if [ -n "$1" ]; then
    interface=$1
    ip=$(ipconfig getifaddr $interface)
    if [ $? -eq 0 ]; then
      echo $ip
    else
      return 1
    fi
  else
    interface_list=($(ifconfig -l))
    for interface in $interface_list; do
        ip=$(ipconfig getifaddr $interface)
        if [ -n "$ip" ]; then
          echo "$interface: $ip"
        fi
    done
  fi
}

function ip-external {
  curl ifconfig.co
}
