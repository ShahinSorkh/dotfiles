function gst --wraps='git stash' --wraps='git status' --description 'alias gst=git status'
  git status $argv; 
end
