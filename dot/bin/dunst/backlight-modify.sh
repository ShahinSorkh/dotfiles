#!/bin/sh

ICONDIR="$HOME/.config/dunst/icons"

xbacklight "$1" "$2"

CURVALUE=$(xbacklight -get)

if [ "${CURVALUE%%\.[[:digit:]]*}" -gt 50 ]
then
    dunstify -u low -h "int:value:$CURVALUE" -I "$ICONDIR"/sun-solid.png -r 9980 "${CURVALUE%%[[:digit:]][[:digit:]][[:digit:]][[:digit:]]}"%
else
    dunstify -u low -h "int:value:$CURVALUE" -I "$ICONDIR"/sun-regular.png -r 9980 "${CURVALUE%%[[:digit:]][[:digit:]][[:digit:]][[:digit:]]}"%
fi
