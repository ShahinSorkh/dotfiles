function cd --description 'alias cd=cd gss'
  if test -n $OLD_PWD && test "$argv[1]" = '-'
    cd $OLD_PWD
    return
  end

  set -g OLD_PWD $PWD

  builtin cd $argv
  and if test -d .git
    gss
  end
end
