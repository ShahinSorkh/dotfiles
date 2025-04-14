function gcB --wraps='git checkout -B' --description 'alias gcB=git checkout -B'
  git checkout -B $argv; 
end
