function gcn! --wraps='git commit --no-edit --amend' --description 'alias gcn!=git commit --no-edit --amend'
  git commit --no-edit --amend $argv; 
end
