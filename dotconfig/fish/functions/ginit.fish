function ginit --wraps='git init; git add .; git commit -m init' --description 'alias ginit=git init; git add .; git commit -m init'
  git init
  git add .
  git commit -m init
end
