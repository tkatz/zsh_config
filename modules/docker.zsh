function docker-setup {
  eval (docker-machine env default)
}

function docker-connect {
  docker exec -i -t $1 bash
}
