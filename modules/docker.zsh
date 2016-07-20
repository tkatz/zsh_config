function docker-env {
  DOCKER_ENV=${1-default}

  if [ "$(docker-machine status $DOCKER_ENV)" = "Stopped" ]; then
    docker-machine start $DOCKER_ENV
  fi

  echo "Set '$DOCKER_ENV' Docker Machine Environment"
  eval $(docker-machine env $DOCKER_ENV)
}

# function docker {
#   if [ -z "$DOCKER_MACHINE_NAME" ]; then
#       docker-env
#   fi
#   command docker $@
# }

function docker-connect {
  docker exec -i -t $1 sh
}

function docker-images-clean {
  docker rmi $(docker images | grep "<none>" | tr -s " " | cut -d " " -f 3)
}

function docker-container-clean {
  docker rm  $(docker ps --filter "status=exited" --quiet)
}


# docker run -it --rm alpine /bin/sh
