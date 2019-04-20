#!/bin/bash

if [ -z "$(rhythmbox-client --print-playing --no-start)" ] || [ "$(rhythmbox-client --print-playing --no-start | xargs)" = '-' ]; then
    echo "🎧 "
    exit 0
fi

TITLE="$(echo $(rhythmbox-client --print-playing-format="%tt") | awk '{ print $1" "$2" "$3 }' | xargs)"
ARTIST="$(echo $(rhythmbox-client --print-playing-format="%ta") | awk '{ print $1" "$2" "$3 }' | xargs)"
ELAPSED=$(rhythmbox-client --print-playing-format="%te")
TOTAL=$(rhythmbox-client --print-playing-format="%td")

# ᠀
# ♩ ♪ ♫ ♬ ♭ ♮ ♯
# 🎧 🎼 𝄞
# ♠ ♣ ♥ ♦
#    

echo "$ARTIST  $TITLE ($ELAPSED/$TOTAL)"
exit 0

