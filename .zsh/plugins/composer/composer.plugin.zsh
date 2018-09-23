# ------------------------------------------------------------------------------
#          FILE:  composer.plugin.zsh
#   DESCRIPTION:  oh-my-zsh composer plugin file.
#        AUTHOR:  Daniel Gomes (me@danielcsgomes.com)
#       VERSION:  1.0.0
# ------------------------------------------------------------------------------

# Composer basic command completion
_composer_get_command_list () {
    $_comp_command1 --no-ansi 2>/dev/null | sed "1,/Available commands/d" | awk '/^[ \t]*[a-z]+/ { print $1 }'
}

_composer_get_required_list () {
    $_comp_command1 show -s --no-ansi 2>/dev/null | sed '1,/requires/d' | awk 'NF > 0 && !/^requires \(dev\)/{ print $1 }'
}

_composer () {
  local curcontext="$curcontext" state line
  typeset -A opt_args
  _arguments \
    '1: :->command'\
    '*: :->args'

  case $state in
    command)
      compadd $(_composer_get_command_list)
      ;;
    *)
      compadd $(_composer_get_required_list)
      ;;
  esac
}

compdef _composer composer
compdef _composer composer.phar

# Aliases
alias c='php composer.phar'
alias csu='php composer.phar self-update'
alias cu='php composer.phar update'
alias cr='php composer.phar require'
alias crm='php composer.phar remove'
alias ci='php composer.phar install'
alias ccp='php composer.phar create-project'
alias cdu='php composer.phar dump-autoload'
alias cdo='php composer.phar dump-autoload --optimize'
alias cgu='php composer.phar global update'
alias cgr='php composer.phar global require'
alias cgrm='php composer.phar global remove'
alias cgsu='php composer.phar global self-update'

# install composer in the current directory
alias cget='curl -s https://getcomposer.org/installer | php'

# Add Composer's global binaries to PATH, using Composer if available.
if (( $+commands[composer] )); then
  export PATH=$PATH:$(composer global config bin-dir --absolute 2>/dev/null)
else
  [ -d $HOME/.composer/vendor/bin ] && export PATH=$PATH:$HOME/.composer/vendor/bin
  [ -d $HOME/.config/composer/vendor/bin ] && export PATH=$PATH:$HOME/.config/composer/vendor/bin
fi
