#!/usr/bin/zsh

NORDSTATUS=$(nordvpn status)

STATUS=$(awk '/Status/ {print $NF}' <(echo $NORDSTATUS))

if [ "$1" = "toggle" ]; then
    if [ "$STATUS" = "Disconnected" ]
    then nordvpn c
    else nordvpn d
    fi
    exit
fi

if [ "$STATUS" = "Disconnected" ]; then
    echo "{\"icon\": \"net_vpn\", \"state\": \"Critical\", \"text\": \"\"}"
    exit
fi

SERVER=$(awk '/Current server/ {print $NF}' <(echo $NORDSTATUS) | cut -d. -f1 | sed -r 's/[[:digit:]]+//g' | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
IP=$(awk '/IP/ {print $NF}' <(echo $NORDSTATUS))
echo "{\"icon\": \"net_vpn\", \"state\": \"Good\", \"text\": \"$SERVER $IP\"}"

