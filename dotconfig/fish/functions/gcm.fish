function gcm
  if git branch -r | grep main >/dev/null
    git checkout main
  else
    git checkout master
  end
end
