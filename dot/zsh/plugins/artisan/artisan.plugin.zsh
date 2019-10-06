# vim: foldmethod=marker foldlevel=0

_laravel5_get_command_list () {
    php artisan --raw --no-ansi list | sed "s/[[:space:]].*//g"
}

_laravel5 () {
    if [ -f artisan ]; then
        compadd `_laravel5_get_command_list`
    fi
}

compdef _laravel5 artisan

alias a='php ./artisan'
# {{{1 artisan make
# {{{2 artisan make:model/controller/middleware/provider
alias amm='php ./artisan make:model'
alias amma='php ./artisan make:model --all'
alias amc='php ./artisan make:controller'
alias amcr='php ./artisan make:controller --resource'
alias ammid='php ./artisan make:middleware'
alias ampr='php ./artisan make:provider'
# 2}}}
# {{{2 artisan make:command/job
alias amcmd='php ./artisan make:command --command'
alias amj='php ./artisan make:job'
# 2}}}
# {{{2 artisan make:test
alias amt='php ./artisan make:test'
alias amtu='php ./artisan make:test --unit'
# 2}}}
# {{{2 artisan make:request/resource/policy
alias amreq='php ./artisan make:request'
alias amres='php ./artisan make:resource'
alias amresc='php ./artisan make:resource --collection'
alias ampo='php ./artisan make:policy'
alias ampom='php ./artisan make:policy --model'
# 2}}}
# {{{2 artisan make:event/listener/observer
alias ame='php ./artisan make:event'
alias aml='php ./artisan make:listener'
alias amlq='php ./artisan make:listener --queued'
alias amle='php ./artisan make:listener --event'
alias amlqe='php ./artisan make:listener --queued --event'
alias amob='php ./artisan make:observer'
alias amobm='php ./artisan make:observer --model'
# 2}}}
# {{{2 artisan make:migration/factory/seeder
alias ammig='php ./artisan make:migration'
alias ammigt='php ./artisan make:migration --table'
alias ammigc='php ./artisan make:migration --create'
alias amf='php ./artisan make:factory'
alias amfm='php ./artisan make:factory --model'
alias amseed='php ./artisan make:seeder'
# 2}}}
# {{{2 artisan make:mail/notification/channel
alias ammail='php ./artisan make:mail'
alias ammailm='php ./artisan make:mail --markdown'
alias amn='php ./artisan make:notification'
alias amnm='php ./artisan make:notification --markdown'
alias amch='php ./artisan make:channel'
# 2}}}
# {{{2 artisan make:exception
alias amexc='php ./artisan make:exception'
alias amexcd='php ./artisan make:exception --render'
alias amexcp='php ./artisan make:exception --report'
alias amexcdp='php ./artisan make:exception --render --report'
# 2}}}
# 1}}}
# {{{1 artisan queue
# {{{2 artisan queue:listen
alias aql='php ./artisan queue:listen'
alias aqlnto='php ./artisan queue:listen --timeout=0' # nto -> no timeout
alias aqlq='php ./artisan queue:listen --queue'
alias aqlntoq='php ./artisan queue:listen --timeout=0 --queue'
# 2}}}
# {{{2 artisan queue:work
alias aqw='php ./artisan queue:work'
alias aqwonce='php ./artisan queue:work --once'
alias aqwoncento='php ./artisan queue:work --once --timeout=0'
alias aqwnto='php ./artisan queue:work --timeout=0'
alias aqwswe='php ./artisan queue:work --stop-when-empty'
alias aqwswento='php ./artisan queue:work --stop-when-empty --timeout=0'
alias aqwq='php ./artisan queue:work --queue'
alias aqwonceq='php ./artisan queue:work --once --queue'
alias aqwoncentoq='php ./artisan queue:work --once --timeout=0 --queue'
alias aqwntoq='php ./artisan queue:work --timeout=0 --queue'
alias aqwsweq='php ./artisan queue:work --stop-when-empty --queue'
alias aqwswentoq='php ./artisan queue:work --stop-when-empty --timeout=0 --queue'
# 2}}}
# {{{2 artisan queue:*
alias aqres='php ./artisan queue:restart'
alias aqret='php ./artisan queue:retry'
alias aqfailed='php ./artisan queue:failed'
alias aqflush='php ./artisan queue:flush'
alias aqforget='php ./artisan queue:forget'
# 2}}}
# 1}}}
# {{{1 artisan migrate
alias amig='php ./artisan migrate'
alias amigs='php ./artisan migrate --seed'
# {{{2 artisan migrate:*
alias amigstat='php ./artisan migrate:status'
alias amigreset='php ./artisan migrate:reset'
alias amigrollb='php ./artisan migrate:rollback'
alias amigfresh='php ./artisan migrate:fresh'
alias amigrefresh='php ./artisan migrate:refresh'
# 2}}}
# 1}}}
# {{{1 artisan *
alias aup='php ./artisan up'
alias adn='php ./artisan down'
alias adbs='php ./artisan db:seed'
alias adbsc='php ./artisan db:seed --class'
alias atink='php ./artisan tinker'
# {{{2 artisan vendor:publish
alias aven='php ./artisan vendor:publish'
alias avena='php ./artisan vendor:publish --all'
alias avent='php ./artisan vendor:publish --tag'
alias avenp='php ./artisan vendor:publish --provider'
# 2}}}
# {{{2 artisan *:generate
alias agene='php ./artisan event:generate'
alias agenk='php ./artisan key:generate'
# 2}}}
# {{{2 artisan *:clear
alias aclrevnet='php ./artisan event:clear'
alias aclrcache='php ./artisan cache:clear'
alias aclrconfig='php ./artisan config:clear'
alias aclrroute='php ./artisan route:clear'
alias aclrview='php ./artisan view:clear'
alias aclrauth='php ./artisan auth:clear-resets'
# 2}}}
# {{{2 artisan *:cache
alias acachconfig='php ./artisan config:cache'
alias acachevent='php ./artisan event:cache'
alias acachroute='php ./artisan route:cache'
alias acachview='php ./artisan view:cache'
# 2}}}
# {{{2 artisan *:list
alias alsroute='php ./artisan route:list'
alias alsevent='php ./artisan event:list'
# 2}}}
# 1}}}
