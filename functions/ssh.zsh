function ssh-tunnel {

  remote_host=$1
  remote_port=$2
  local_port=$3

  ssh -L ${local_port}:localhost:${remote_port} ${remote_host}
}
