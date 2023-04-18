function gdw --wraps='git diff --word-diff=plain' --wraps='git diff --word-diff=color' --description 'alias gdw=git diff --word-diff=color'
  git diff --word-diff=color $argv
        
end
