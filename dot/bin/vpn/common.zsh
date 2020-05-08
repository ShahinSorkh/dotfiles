#!/usr/bin/zsh

PATH=/usr/sbin:/usr/bin:/sbin:/bin

function get_gateway () {
    echo $(ip route | grep -E '^default' | grep -o -E 'via [[:digit:].]+' | cut -d' ' -f2)
}

function get_gateway6 () {
    INTERFACE=$(get_dirif)
    echo $(ip addr show dev $INTERFACE | grep inet6 | xargs | cut -d' ' -f2 | cut -d/ -f1)
}

function get_vpnif () {
    echo $(ip route | grep -m 1 -o -E 'dev tun[[:alnum:]]+' | cut -d' ' -f2 | xargs) # tun0
}

function get_dirif () {
    echo $(ip route | grep -E '^default' | grep -o -E 'dev [[:alnum:]]+' | cut -d' ' -f2 | xargs) # wlo1
}
