function gcam --wraps='git commit -am' --description 'alias gcam=git commit -am'
  git commit -am $argv; 
end
