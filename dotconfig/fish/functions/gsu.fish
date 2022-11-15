function gsu --wraps='git submodule update' --description 'alias gsu=git submodule update'
  git submodule update $argv; 
end
