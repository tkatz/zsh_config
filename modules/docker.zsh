function docker-setup {
  DOCKER_ENV=${1-default}

  DOCKER_MACHINE_STATUS=$(docker-machine status $DOCKER_ENV)
  if [ "$DOCKER_MACHINE_STATUS" = "Stopped" ]; then
    docker-machine start $DOCKER_ENV
  fi

  eval $(docker-machine env $DOCKER_ENV)
}

function docker-connect {
  docker exec -i -t $1 bash
}
