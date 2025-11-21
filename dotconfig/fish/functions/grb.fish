function grb --wraps='git rebase' --description 'alias grb=git rebase'
  git rebase --autostash $argv
end
