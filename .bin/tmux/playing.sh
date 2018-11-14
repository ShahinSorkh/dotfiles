#!/bin/bash

INFO="$(mocp -i &2>/dev/null)"

STATE="$(echo "$INFO" | awk '/^State/ { print $2 }')"
TITLE="$(echo "$INFO" | awk '/^SongTitle/ { printf "%s %s", $2, $3 }')"
ARTIST="$(echo "$INFO" | awk '/^Artist/ { printf "%s %s", $2, $3 }')"
ELAPSED="$(echo "$INFO" | awk '/^CurrentTime/ { print $2 }')"
TOTAL="$(echo "$INFO" | awk '/^TotalTime/ { print $2 }')"

case "$STATE" in
    STOP)
        PLAYING="⏹"
        ;;
    PLAY)
        PLAYING="⏵"
        ;;
    PAUSE)
        PLAYING="⏸"
        ;;
    *)
        PLAYING=""
        ;;
esac

if [ "$TITLE" == "" ]; then
    echo "$PLAYING 🎧 "
    exit 0
fi

# ᠀
# ♩ ♪ ♫ ♬ ♭ ♮ ♯
# 🎧 🎼 𝄞
# ♠ ♣ ♥ ♦
# ⏴  ⏵  ⏶  ⏷  ⏸  ⏹  ⏺  
#    

# echo $TITLE
echo "$PLAYING $ARTIST  $TITLE ($ELAPSED/$TOTAL)"

exit 0
