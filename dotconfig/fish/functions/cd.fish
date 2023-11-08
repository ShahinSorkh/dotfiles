function cd --description 'alias cd=cd gss'
 builtin cd $argv
 and if test -d .git
   gss
 end
end
