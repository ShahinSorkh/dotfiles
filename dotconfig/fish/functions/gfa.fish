function gfa --wraps='git fetch -p -a' --description 'alias gfa=git fetch -p -a'
  git fetch -p -a $argv; 
end
