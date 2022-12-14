function gls --wraps='git files' --wraps='git ls-files' --description 'alias gls=git ls-files'
  git ls-files $argv; 
end
