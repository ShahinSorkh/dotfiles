#!/usr/bin/zsh

STATE="$(echo "$(mocp -i &2>/dev/null)" | awk '/^State/ { print $2 }' | xargs)"

case "$STATE" in
    STOP)
        mocp -p 2>&1 >/dev/null
        ;;
    PLAY)
        mocp -P 2>&1 >/dev/null
        ;;
    PAUSE)
        mocp -U 2>&1 >/dev/null
        ;;
    *)
        mocp -S 2>&1 >/dev/null
        mocp -p 2>&1 >/dev/null
        ;;
esac

exit 0
