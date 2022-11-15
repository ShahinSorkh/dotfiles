function gsp --wraps='git stash pop' --description 'alias gsp=git stash pop'
  git stash pop $argv; 
end
