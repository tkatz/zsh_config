function ssh-tunnel {

  remote_host=$1
  remote_port=$2
  local_port=$3

  ssh -L ${local_port}:localhost:${remote_port} ${remote_host}
}

# ~/.ssh/config
######
# Host *
#   IdentityFile ~/.ssh/id_rsa+%r@%h
# Host *
#   IdentityFile ~/.ssh/id_rsa
######
#
# e.g. ~/.ssh/id_rsa+<REMOTE_USER>@<REMOTE_HOST>
#
# ln -s <KEY_NAME>.pub <TARGET_KEY_NAME>.pub
# ln -s <KEY_NAME>     <TARGET_KEY_NAME>


function ssh-key-set {
   ssh-add -D
   ssh-add ~"/.ssh/$1"
}

function ssh-key-info {
   ssh-keygen -l -f ~"/.ssh/$1"
}
