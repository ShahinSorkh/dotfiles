function gss --wraps='git status -s' --wraps='git status -s -b' --description 'alias gss=git status -s -b'
  git status -s -b $argv; 
end
