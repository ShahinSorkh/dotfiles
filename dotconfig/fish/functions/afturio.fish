function afturio --wraps='docker compose -f $HOME/code/github.com/agileful/travimo-dev-infra-on-docker/docker-compose.yml'
  set WORKINGDIR $(pwd)
  cd $HOME/code/github.com/agileful/travimo-dev-infra-on-docker
  docker compose $argv
  cd $WORKINGDIR
end
