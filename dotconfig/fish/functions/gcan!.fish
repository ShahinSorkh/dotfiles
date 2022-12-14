function gcan! --wraps='git commit --no-edit --amend -a' --description 'alias gcan!=git commit --no-edit --amend -a'
  git commit --no-edit --amend -a $argv; 
end
