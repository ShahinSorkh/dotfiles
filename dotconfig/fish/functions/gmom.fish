function gmom --wraps='git merge origin master' --wraps='git merge origin/master' --description 'alias gmom=git merge origin/master'
  git merge origin/master $argv
        
end
