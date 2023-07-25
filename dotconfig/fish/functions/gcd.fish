function gcd
  if git branch -r | grep development >/dev/null
    git checkout development
  else if git branch -r | grep develop >/dev/null
    git checkout develop
  else
    git checkout dev
  end
end
