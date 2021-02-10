#!/usr/bin/zsh

echo "{\"icon\": \"net_vpn\", \"state\": \"Critical\", \"text\": \"\"}"
exit

#NORDSTATUS=$(nordvpn status)
#WINDSTATUS=$(windscribe status 2>&1)


if [ "$1" = "toggle" ]; then
    if ( grep -F 'Connected' <(echo $NORDSTATUS) >/dev/null ); then nordvpn d
    elif ( grep -P '\bCONNECTED' <(echo $WINDSTATUS) >/dev/null ); then windscribe disconnect
    else windscribe connect best
    fi
    exit
fi


if ( grep -F 'Connected' <(echo $NORDSTATUS) >/dev/null ); then
    SERVER=$(awk '/Current server/ {print $NF}' <(echo $NORDSTATUS) | cut -d. -f1 | sed -r 's/[[:digit:]]+//g' | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    IP=$(awk '/IP/ {print $NF}' <(echo $NORDSTATUS))
    echo "{\"icon\": \"net_vpn\", \"state\": \"Good\", \"text\": \"$SERVER $IP (N)\"}"
    exit
fi

if ( grep -P '\bCONNECTED' <(echo $WINDSTATUS) >/dev/null ); then
    SERVER=$(awk '/CONNECTED/ {print $3}' <(echo $WINDSTATUS))
    IP=$(awk '/IP/ {print $2}' <(echo $WINDSTATUS))
    echo "{\"icon\": \"net_vpn\", \"state\": \"Good\", \"text\": \"$SERVER $IP (W)\"}"
    exit
fi


echo "{\"icon\": \"net_vpn\", \"state\": \"Critical\", \"text\": \"\"}"
