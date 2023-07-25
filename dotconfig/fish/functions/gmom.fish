function gmom --wraps='git merge origin master' --wraps='git merge origin/master' --description 'alias gmom=git merge origin/master'
  if git branch -r | grep main >/dev/null
      git merge origin/main $argv
  else
      git merge origin/master $argv
  end
end
