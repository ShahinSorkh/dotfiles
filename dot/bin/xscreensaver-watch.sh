#!/bin/sh

xscreensaver-command -watch | while read event rest; do
    case $event in
        "LOCK"|"BLANK")
            pkill -USR1 -x -u `id -u` dunst
            setxkbmap -layout us
            ;;
        "UNBLANK")
            pkill -USR2 -x -u `id -u` dunst
            ;;
    esac
done
