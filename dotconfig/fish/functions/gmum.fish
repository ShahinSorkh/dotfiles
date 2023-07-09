function gmum --wraps='git merge upstream master' --wraps='git merge upstream/master' --description 'alias gmum=git merge upstream/master'
  git merge upstream/master $argv
        
end
