#!/bin/sh

CURLAYOUT=$(setxkbmap -query | awk '/^layout/ {print $2}')
case "$CURLAYOUT" in
    us) setxkbmap ir;;
    ir) setxkbmap us;;
esac
