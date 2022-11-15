function glog --wraps='git log --oneline --graph --decorate' --description 'alias glog=git log --oneline --graph --decorate'
  git log --oneline --graph --decorate $argv; 
end
