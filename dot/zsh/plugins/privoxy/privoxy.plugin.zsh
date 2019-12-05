#!/usr/bin/zsh

connect_privoxy () {
    proxy=${1:-http://127.0.0.1:8118}
    # Privoxy custom configs at
    # https://gist.github.com/f9934cc954a3c719576b5273c080da5e.git
    export ALL_PROXY=$proxy
    export HTTPS_PROXY=$proxy
    export HTTP_PROXY=$proxy
    export all_proxy=$proxy
    export http_proxy=$proxy
    export https_proxy=$proxy
}

disconnect_privoxy () {
    unset ALL_PROXY
    unset HTTPS_PROXY
    unset HTTP_PROXY
    unset all_proxy
    unset http_proxy
    unset https_proxy
}
