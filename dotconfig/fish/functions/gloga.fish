function gloga --wraps='git log --oneline --graph --decorate --all' --description 'alias gloga=git log --oneline --graph --decorate --all'
  git log --oneline --graph --decorate --all $argv; 
end
