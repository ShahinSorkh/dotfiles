function gmum --wraps='git merge upstream master' --wraps='git merge upstream/master' --description 'alias gmum=git merge upstream/master'
  if git branch -r | grep main >/dev/null
      git merge upstream/main $argv
  else
      git merge upstream/master $argv
  end
end
