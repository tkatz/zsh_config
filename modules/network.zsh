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

function ip-internal6 {
  interface_list=($(ifconfig -l))
  for interface in $interface_list; do
      if [ $interface != "lo0" ]; then
        ip6=$(ifconfig $interface | grep inet6 | awk -F " " '{print $2}')
        if [ -n "$ip6" ]; then
          echo "$interface"
          echo "$ip6"
        fi
      fi
  done
}

function ip-external {
  curl ifconfig.co
}

function ip-external4 {
  curl v4.ifconfig.co
}

function ip-external6 {
  curl v6.ifconfig.co
}
