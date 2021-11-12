#!/bin/sh

ICONDIR="$HOME/.config/dunst/icons"

notify_vol () {
    OUT=$(pactl get-sink-volume "$SINK" | tr ' ' "\n" | awk '/[[:digit:]]+%/ {vol=$1} /-?[^0][[:digit:]]*\.[[:digit:]]+/ {db=$1} END {printf "%s  %s dB", vol, db ? db : "0.00"}')
    VOL=$(echo "$OUT" | grep -E -o '^[[:digit:]]+')

    if [ "$VOL" -gt 100 ]
    then
        dunstify -u critical -h "int:value:$VOL" -I "$ICONDIR"/volume-up.png -r 9970 'You fucking kidding me?!' "$OUT"
    elif [ "$VOL" -gt 70 ]
    then
        dunstify -u low -h "int:value:$VOL" -I "$ICONDIR"/volume-up.png -r 9970 "$OUT"
    elif [ "$VOL" -lt 30 ]
    then
        dunstify -u low -h "int:value:$VOL" -I "$ICONDIR"/volume-off.png -r 9970 "$OUT"
    else
        dunstify -u low -h "int:value:$VOL" -I "$ICONDIR"/volume-down.png -r 9970 "$OUT"
    fi
}

SINK="@DEFAULT_SINK@"

pactl "$1" "$SINK" "$2"

if [ "$1" = 'set-sink-mute' ]
then
    MUT=$(pactl get-sink-mute "$SINK" | cut -d' ' -f2)
    if [ "$MUT" = 'yes' ]
    then
        dunstify -u low -h "int:value:0" -I "$ICONDIR"/volume-mute.png -r 9970 'muted'
    else
        notify_vol
    fi
    exit 0
fi

pactl set-sink-mute "$SINK" 0
notify_vol
