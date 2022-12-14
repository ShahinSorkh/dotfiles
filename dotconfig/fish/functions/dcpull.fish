function dcpull --wraps='docker compose pull' --description 'alias dcpull=docker compose pull'
  docker compose pull $argv; 
end
