function gsl --wraps='git stash list' --description 'alias gsl=git stash list'
  git stash list $argv; 
end
