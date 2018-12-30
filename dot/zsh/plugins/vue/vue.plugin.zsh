# Completion for Vue.js cli

_vue() {
    typeset -a commands
    commands=(
        'create[create a new project powered by vue-cli-service]'
        'add[install a plugin and invoke its generator in an already created project]'
        'invoke[invoke the generator of a plugin in an already created project]'
        'inspect[inspect the webpack config in a project with vue-cli-service]'
        'serve[serve a .js or .vue file in development mode with zero config]'
        'build[build a .js or .vue file in production mode with zero config]'
        'ui[start and open the vue-cli ui]'
        'init[generate a project from a remote template (legacy API, requires @vue/cli-init)]'
        'config[inspect and modify the config]'
        'upgrade[upgrade vue cli service / plugins (default semverLevel: minor)]'
        'info[print debugging information about your environment]'
    )

    if (( CURRENT == 2 )); then
        # explain go commands
        _values 'vue cli commands' ${commands[@]}
        return
    fi

    case ${words[2]} in
        help)
            if (( CURRENT == 3 )); then
                _values '' \
                    'create[create a new project powered by vue-cli-service]' \
                    'add[install a plugin and invoke its generator in an already created project]' \
                    'invoke[invoke the generator of a plugin in an already created project]' \
                    'inspect[inspect the webpack config in a project with vue-cli-service]' \
                    'serve[serve a .js or .vue file in development mode with zero config]' \
                    'build[build a .js or .vue file in production mode with zero config]' \
                    'ui[start and open the vue-cli ui]' \
                    'init[generate a project from a remote template (legacy API, requires @vue/cli-init)]' \
                    'config[inspect and modify the config]' \
                    'upgrade[upgrade vue cli service / plugins (default semverLevel: minor)]' \
                    'info[print debugging information about your environment]'
            fi
            ;;
    esac
}

compdef _vue vue
