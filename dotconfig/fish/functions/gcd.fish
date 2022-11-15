function gcd
  if git branch -r | grep develop >/dev/null
    git checkout develop
  else
    git checkout dev
  end
end
