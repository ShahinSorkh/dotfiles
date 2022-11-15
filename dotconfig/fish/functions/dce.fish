function dce --wraps='docker compose exec' --description 'alias dce=docker compose exec'
  docker compose exec $argv; 
end
