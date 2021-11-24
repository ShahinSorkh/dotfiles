#!/bin/sh

ICONDIR="$HOME/.config/dunst/icons"
CURLAYOUT=$(setxkbmap -query | awk '/^layout/ {print $2}')

case "$CURLAYOUT" in
    us)
        setxkbmap ir
        dunstify -r 9960 -u low -I "$ICONDIR"/globe-asia.png 'fa'
        ;;
    ir)
        setxkbmap us
        dunstify -r 9960 -u low -I "$ICONDIR"/globe-americas.png 'en'
        ;;
esac