#!/usr/bin/zsh

exit 0
INFO="$(mocp -i 2>/dev/null)"

STATE="$(echo "$INFO" | awk '/^State/ { print $2 }' | xargs)"
TITLE="$(echo "$INFO" | awk '/^SongTitle/ { printf "%s %s", $2, $3 }' | xargs)"
ARTIST="$(echo "$INFO" | awk '/^Artist/ { printf "%s %s", $2, $3 }' | xargs)"
ELAPSED="$(echo "$INFO" | awk '/^CurrentTime/ { print $2 }' | xargs)"
TOTAL="$(echo "$INFO" | awk '/^TotalTime/ { print $2 }' | xargs)"

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

if [ -z "$TITLE" ] && [ -z "$ARTIST" ]; then
    echo "$PLAYING 🎧"
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
