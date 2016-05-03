function docker-setup {
  DOCKER_ENV=${1-default}
  eval $(docker-machine env $DOCKER_ENV)
}

function docker-connect {
  docker exec -i -t $1 bash
}
