function cd --description 'alias cd=cd gss'
 if not set -q __shso_cd_sourced
   sed 's/function cd/function cd2/' /usr/share/fish/functions/cd.fish | source -
   set -x __shso_cd_sourced
 end

 cd2 $argv
 and if test -d .git
   gss
 end
end
