function dcupd --wraps='docker compose up -d' --description 'alias dcupd=docker compose up -d'
  docker compose up -d $argv; 
end
