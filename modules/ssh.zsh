function ssh-tunnel {

  remote_host=$1
  remote_port=$2
  local_port=$3

  ssh -L ${local_port}:localhost:${remote_port} ${remote_host}
}

# Host *
#   IdentityFile ~/.ssh/%l_%r@%h_id_rsa
#
# e.g. ~/.ssh/<LOCAL_USER>_<REMOTE_USER>@<REMOTE_HOST>_id_rsa

# ln -s <KEY_NAME>.pub <TARGET_KEY_NAME>.pub
# ln -s <KEY_NAME>     <TARGET_KEY_NAME>


function ssh-key-info {
   ssh-keygen -l -f ~/.ssh/$1
}
